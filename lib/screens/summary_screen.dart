import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  final _formatter = NumberFormat.currency(locale: 'en_UG', symbol: 'UGX ');

  Stream<double> _getClientTotal({
    required int clientId,
    required String table,
    required String column,
  }) {
    final sql = 'SELECT SUM($column) AS total FROM $table WHERE client_id = ?';
    return database
        .customSelect(
          sql,
          variables: [drift.Variable.withInt(clientId)],
        )
        .watch()
        .map((rows) {
          if (rows.isEmpty) return 0.0;
          final result = rows.first.data['total'];
          if (result == null) return 0.0;
          return (result is int) ? result.toDouble() : result as double;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Summary Totals'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, clientSnap) {
          if (!clientSnap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = clientSnap.data!;
          if (clients.isEmpty) {
            return const Center(child: Text("No clients found"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: clients.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final client = clients[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${client.name} (ID: ${client.clientId})",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      _buildTotalRow(
                          "Loans Total", client.id, 'loans', 'amount'),
                      _buildTotalRow("Loan Payments", client.id,
                          'loan_payments', 'amount'),
                      _buildTotalRow("Savings", client.id, 'savings', 'amount'),
                      _buildTotalRow(
                          "Welfares", client.id, 'welfares', 'amount'),
                      _buildTotalRow(
                          "Penalties", client.id, 'penalties', 'amount'),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserDetailsScreen(client: client),
                          ),
                        ),
                        child: const Text("View Full Client Details"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTotalRow(
      String label, int clientId, String table, String column) {
    return StreamBuilder<double>(
      stream: _getClientTotal(clientId: clientId, table: table, column: column),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting || !snap.hasData) {
          return const SizedBox(height: 20); // prevent null in Column
        }
        final value = snap.data!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(
                _formatter.format(value),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
