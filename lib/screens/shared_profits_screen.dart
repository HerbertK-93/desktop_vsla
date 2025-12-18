import 'dart:async';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:intl/intl.dart';
import 'package:vsla_desktop/database/database.dart';

class SharedProfitsScreen extends StatefulWidget {
  const SharedProfitsScreen({super.key});

  @override
  State<SharedProfitsScreen> createState() => _SharedProfitsScreenState();
}

class _SharedProfitsScreenState extends State<SharedProfitsScreen> {
  late final AppDatabase _db;
  late final StreamSubscription _dbSubscription;

  bool _isLoading = true;
  double _totalSavings = 0.0;
  double _netProfit = 0.0;
  List<_ProfitShare> _shares = [];
  DateTime? _lastUpdated;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();

    // Reactive watcher: fires whenever relevant tables change
    _dbSubscription = _db
        .customSelect(
          'SELECT 1',
          readsFrom: {
            _db.savings,
            _db.interestIncome,
            _db.penalties,
            _db.subscriptions,
            _db.costs,
          },
        )
        .watch()
        .listen((_) {
          _calculateShares();
        });

    _calculateShares();
  }

  @override
  void dispose() {
    _dbSubscription.cancel();
    super.dispose();
  }

  Future<void> _calculateShares() async {
    if (mounted) {
      setState(() => _isLoading = true);
    }

    try {
      // Total savings
      final savingsRow = await (_db.select(
        _db.savings,
      )..addColumns([_db.savings.amount.sum()])).getSingleOrNull();

      _totalSavings = (savingsRow?.read(_db.savings.amount.sum()) ?? 0)
          .toDouble();

      // Income
      final interestRow = await (_db.select(
        _db.interestIncome,
      )..addColumns([_db.interestIncome.amount.sum()])).getSingleOrNull();

      final totalInterest =
          (interestRow?.read(_db.interestIncome.amount.sum()) ?? 0).toDouble();

      final penaltiesRow = await (_db.select(
        _db.penalties,
      )..addColumns([_db.penalties.amount.sum()])).getSingleOrNull();

      final totalPenalties =
          (penaltiesRow?.read(_db.penalties.amount.sum()) ?? 0).toDouble();

      final subscriptionsRow = await (_db.select(
        _db.subscriptions,
      )..addColumns([_db.subscriptions.amount.sum()])).getSingleOrNull();

      final totalSubscriptions =
          (subscriptionsRow?.read(_db.subscriptions.amount.sum()) ?? 0)
              .toDouble();

      final totalIncome = totalInterest + totalPenalties + totalSubscriptions;

      // Expenses
      final costsRow = await (_db.select(
        _db.costs,
      )..addColumns([_db.costs.amount.sum()])).getSingleOrNull();

      final totalExpenses = (costsRow?.read(_db.costs.amount.sum()) ?? 0)
          .toDouble();

      // Net profit
      _netProfit = totalIncome - totalExpenses;

      // Per-member savings and profit share
      final rows = await _db
          .customSelect(
            '''
        SELECT c.name, SUM(s.amount) AS total_savings
        FROM clients c
        LEFT JOIN savings s ON c.id = s.client_id
        GROUP BY c.id
        ORDER BY c.name ASC
        ''',
            readsFrom: {_db.clients, _db.savings},
          )
          .get();

      _shares = rows.map((row) {
        final name = row.read<String>('name') ?? 'Unknown';
        final memberSavings = (row.read<num?>('total_savings') ?? 0).toDouble();

        final share = _totalSavings == 0
            ? 0.0
            : (memberSavings / _totalSavings) * _netProfit;

        return _ProfitShare(name, memberSavings, share);
      }).toList();

      _lastUpdated = DateTime.now();
    } catch (e) {
      debugPrint('Error calculating shares: $e');
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = _lastUpdated == null
        ? 'Never'
        : DateFormat('dd MMM yyyy, hh:mm a').format(_lastUpdated!);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Shared Profits'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 224, 241),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _calculateShares,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(formattedTime),
    );
  }

  Widget _buildContent(String formattedTime) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 🔹 Simplified summary row (no card)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoTile(
                icon: Icons.savings,
                color: Colors.green,
                title: 'Total Savings',
                value: 'UGX ${_totalSavings.toStringAsFixed(2)}',
              ),
              _infoTile(
                icon: Icons.trending_up,
                color: Colors.indigo,
                title: 'Net Profit',
                value: 'UGX ${_netProfit.toStringAsFixed(2)}',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: _shares.isEmpty
                    ? const Center(child: Text('No member data available'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Per-Member Profit Distribution',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              child: DataTable(
                                headingRowColor: WidgetStatePropertyAll(
                                  Colors.indigo.shade100,
                                ),
                                columns: const [
                                  DataColumn(label: Text('Member')),
                                  DataColumn(
                                    label: Text('Total Savings (UGX)'),
                                  ),
                                  DataColumn(label: Text('Profit Share (UGX)')),
                                ],
                                rows: _shares
                                    .map(
                                      (s) => DataRow(
                                        cells: [
                                          DataCell(Text(s.name)),
                                          DataCell(
                                            Text(
                                              s.totalSavings.toStringAsFixed(2),
                                            ),
                                          ),
                                          DataCell(
                                            Text(s.share.toStringAsFixed(2)),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Last updated: $formattedTime',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfitShare {
  final String name;
  final double totalSavings;
  final double share;

  _ProfitShare(this.name, this.totalSavings, this.share);
}
