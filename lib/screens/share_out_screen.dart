// lib/screens/share_out_screen.dart

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
  late final StreamSubscription _dbSubscription;

  bool _isLoading = true;
  double _totalSavings = 0.0;
  double _shareOutAmount = 0.0;
  List<_ShareOutItem> _shareOuts = [];
  DateTime? _lastUpdated;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();

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
        .listen((_) => _calculateShareOut());

    _calculateShareOut();
  }

  @override
  void dispose() {
    _dbSubscription.cancel();
    super.dispose();
  }

  Future<void> _calculateShareOut() async {
    if (mounted) setState(() => _isLoading = true);

    try {
      final savingsRow = await (_db.select(
        _db.savings,
      )..addColumns([_db.savings.amount.sum()])).getSingleOrNull();

      _totalSavings = (savingsRow?.read(_db.savings.amount.sum()) ?? 0)
          .toDouble();

      final interestRow = await (_db.select(
        _db.interestIncome,
      )..addColumns([_db.interestIncome.amount.sum()])).getSingleOrNull();

      final penaltiesRow = await (_db.select(
        _db.penalties,
      )..addColumns([_db.penalties.amount.sum()])).getSingleOrNull();

      final subscriptionsRow = await (_db.select(
        _db.subscriptions,
      )..addColumns([_db.subscriptions.amount.sum()])).getSingleOrNull();

      final totalIncome =
          (interestRow?.read(_db.interestIncome.amount.sum()) ?? 0).toDouble() +
          (penaltiesRow?.read(_db.penalties.amount.sum()) ?? 0).toDouble() +
          (subscriptionsRow?.read(_db.subscriptions.amount.sum()) ?? 0)
              .toDouble();

      final costsRow = await (_db.select(
        _db.costs,
      )..addColumns([_db.costs.amount.sum()])).getSingleOrNull();

      final totalExpenses = (costsRow?.read(_db.costs.amount.sum()) ?? 0)
          .toDouble();

      _shareOutAmount = totalIncome - totalExpenses;

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

      _shareOuts = rows.map((row) {
        final name = row.read<String>('name') ?? 'Unknown';
        final memberSavings = (row.read<num?>('total_savings') ?? 0).toDouble();

        final shareOut = _totalSavings == 0
            ? 0.0
            : (memberSavings / _totalSavings) * _shareOutAmount;

        return _ShareOutItem(name, memberSavings, shareOut);
      }).toList();

      _lastUpdated = DateTime.now();
    } catch (e) {
      debugPrint('Error calculating share out: $e');
    }

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = _lastUpdated == null
        ? 'Never'
        : DateFormat('dd MMM yyyy, hh:mm a').format(_lastUpdated!);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Share Out'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 224, 241),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _calculateShareOut,
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
        children: [
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
                icon: Icons.call_split,
                color: Colors.indigo,
                title: 'Total Share Out',
                value: 'UGX ${_shareOutAmount.toStringAsFixed(2)}',
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
                child: _shareOuts.isEmpty
                    ? const Center(child: Text('No member data available'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Per-Member Share Out',
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
                                  DataColumn(
                                    label: Text('Share Out Amount (UGX)'),
                                  ),
                                ],
                                rows: _shareOuts
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
                                            Text(s.shareOut.toStringAsFixed(2)),
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

class _ShareOutItem {
  final String name;
  final double totalSavings;
  final double shareOut;

  _ShareOutItem(this.name, this.totalSavings, this.shareOut);
}
