import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vsla_desktop/main.dart';

class GroupSummaryScreen extends StatelessWidget {
  GroupSummaryScreen({Key? key}) : super(key: key);

  final _formatter = NumberFormat.currency(locale: 'en_UG', symbol: 'UGX ');

  final List<_SummaryItem> items = const [
    _SummaryItem("Total Loans", 'loans', 'amount', Icons.account_balance),
    _SummaryItem(
        "Total Loan Payments", 'loan_payments', 'amount', Icons.payments),
    _SummaryItem("Total Savings", 'savings', 'amount', Icons.savings),
    _SummaryItem(
        "Total Welfares", 'welfares', 'amount', Icons.volunteer_activism),
    _SummaryItem("Total Penalties", 'penalties', 'amount', Icons.warning_amber),
    _SummaryItem(
        "Total Subscriptions", 'subscriptions', 'amount', Icons.subscriptions),
    _SummaryItem("Total Interest Income", 'interest_income', 'amount',
        Icons.trending_up),
    _SummaryItem("Total Investments", 'investments', 'amount',
        Icons.account_balance_wallet),
    _SummaryItem("Total Costs", 'costs', 'amount', Icons.money_off_csred),
  ];

  Stream<double> _getGroupTotal({
    required String table,
    required String column,
  }) {
    final sql = 'SELECT SUM($column) AS total FROM $table';
    return database.customSelect(sql).watch().map((rows) {
      if (rows.isEmpty) return 0.0;
      final result = rows.first.data['total'];
      if (result == null) return 0.0;
      return (result is int) ? result.toDouble() : result as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 250;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Financial Summary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: crossAxisCount > 1 ? crossAxisCount : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
          children: items.map((item) {
            return StreamBuilder<double>(
              stream: _getGroupTotal(table: item.table, column: item.column),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final value = snapshot.data!;
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.icon, size: 28, color: Colors.blueGrey),
                        const SizedBox(height: 10),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _formatter.format(value),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _SummaryItem {
  final String label;
  final String table;
  final String column;
  final IconData icon;

  const _SummaryItem(this.label, this.table, this.column, this.icon);
}
