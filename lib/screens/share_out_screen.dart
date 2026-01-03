import 'dart:async';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:intl/intl.dart';
import 'package:vsla_desktop/database/database.dart';

class ShareOutScreen extends StatefulWidget {
  const ShareOutScreen({super.key});

  @override
  State<ShareOutScreen> createState() => _ShareOutScreenState();
}

class _ShareOutScreenState extends State<ShareOutScreen> {
  late final AppDatabase _db;
  late final StreamSubscription _subscription;

  bool _loading = true;
  DateTime? _lastUpdated;

  double _totalCosts = 0;
  List<_ShareOutItem> _items = [];

  @override
  void initState() {
    super.initState();
    debugPrint('🟢 ShareOutScreen initState');

    _db = AppDatabase();

    _subscription = _db
        .customSelect(
          'SELECT 1',
          readsFrom: {_db.clients, _db.savings, _db.interestIncome, _db.costs},
        )
        .watch()
        .listen((_) {
          debugPrint('🔁 Database change detected');
          _calculate();
        });

    _calculate();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _calculate() async {
    debugPrint('▶️ _calculate() START');
    setState(() => _loading = true);

    try {
      debugPrint('📂 Listing SQLite tables');
      final tables = await _db
          .customSelect("SELECT name FROM sqlite_master WHERE type='table'")
          .get();

      for (final t in tables) {
        debugPrint('📁 TABLE: ${t.data}');
      }

      debugPrint('📑 interest_income columns');
      final cols = await _db
          .customSelect("PRAGMA table_info(interest_income)")
          .get();

      for (final c in cols) {
        debugPrint('📄 COLUMN: ${c.data}');
      }

      debugPrint('🧮 Calculating total costs');

      final costQuery = _db.select(_db.costs)
        ..addColumns([_db.costs.amount.sum()]);

      final costRow = await costQuery.getSingleOrNull();
      _totalCosts = (costRow?.read(_db.costs.amount.sum()) ?? 0).toDouble();

      debugPrint('💰 Total costs = $_totalCosts');

      const shareOutSql = '''
        SELECT
          c.name,
          COALESCE(SUM(s.amount),0) AS savings,
          COALESCE(SUM(
            CASE WHEN ii.source = 'personal_loan'
            THEN ii.amount * 0.5 ELSE 0 END
          ),0) AS personal_interest,
          COALESCE(SUM(
            CASE WHEN ii.source = 'group_loan'
            THEN ii.amount ELSE 0 END
          ),0) AS group_interest
        FROM clients c
        LEFT JOIN savings s ON s.client_id = c.id
        LEFT JOIN interest_income ii ON ii.client_id = c.id
        GROUP BY c.id
        ORDER BY c.name
      ''';

      final rows = await _db.customSelect(shareOutSql).get();

      debugPrint('📦 Rows returned: ${rows.length}');
      if (rows.isNotEmpty) {
        debugPrint('🧪 First row: ${rows.first.data}');
      }

      final costPerMember = rows.isEmpty ? 0.0 : _totalCosts / rows.length;

      debugPrint('➗ Cost per member = $costPerMember');

      _items = rows.map((r) {
        debugPrint('🔍 Row: ${r.data}');

        final name = r.read<String>('name');

        final savings = (r.read<double>('savings')).toDouble();
        final personalInterest = (r.read<double>(
          'personal_interest',
        )).toDouble();
        final groupInterest = (r.read<double>('group_interest')).toDouble();

        final shareOut =
            savings + personalInterest + groupInterest - costPerMember;

        return _ShareOutItem(
          name: name,
          savings: savings,
          personalInterest: personalInterest,
          groupInterest: groupInterest,
          costs: costPerMember,
          shareOut: shareOut,
        );
      }).toList();

      debugPrint('✅ _calculate SUCCESS');
    } catch (e, st) {
      debugPrint('💥 ERROR in _calculate');
      debugPrint('❌ $e');
      debugPrint(st.toString());
    } finally {
      setState(() {
        _lastUpdated = DateTime.now();
        _loading = false;
      });
      debugPrint('⏹ _calculate END');
    }
  }

  @override
  Widget build(BuildContext context) {
    final time = _lastUpdated == null
        ? 'Never'
        : DateFormat('dd MMM yyyy, hh:mm a').format(_lastUpdated!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Out'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _calculate),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ..._items.map(
                  (s) => Card(
                    child: ListTile(
                      title: Text(s.name),
                      subtitle: Text(
                        'Savings: ${s.savings}\n'
                        'Personal Interest: ${s.personalInterest}\n'
                        'Group Interest: ${s.groupInterest}\n'
                        'Costs: ${s.costs}',
                      ),
                      trailing: Text(
                        'UGX ${s.shareOut.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Last updated: $time',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
    );
  }
}

extension on SimpleSelectStatement<$CostsTable, Cost> {
  get sql => null;
}

class _ShareOutItem {
  final String name;
  final double savings;
  final double personalInterest;
  final double groupInterest;
  final double costs;
  final double shareOut;

  _ShareOutItem({
    required this.name,
    required this.savings,
    required this.personalInterest,
    required this.groupInterest,
    required this.costs,
    required this.shareOut,
  });
}
