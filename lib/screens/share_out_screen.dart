import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import 'package:vsla_desktop/database/database.dart';
import 'package:vsla_desktop/main.dart';

class ShareOutScreen extends StatelessWidget {
  ShareOutScreen({super.key});

  final _currency = NumberFormat.currency(locale: 'en_UG', symbol: 'UGX ');

  Stream<double> _getTotal(int clientId, String table) {
    final sql = 'SELECT SUM(amount) AS total FROM $table WHERE client_id = ?';
    return database
        .customSelect(sql, variables: [drift.Variable.withInt(clientId)])
        .watch()
        .map((rows) {
          if (rows.isEmpty) return 0.0;
          final v = rows.first.data['total'];
          if (v == null) return 0.0;
          return (v is int) ? v.toDouble() : v as double;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Share Out'), centerTitle: true),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, clientSnap) {
          if (!clientSnap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = clientSnap.data!;
          if (clients.isEmpty) {
            return const Center(child: Text('No clients found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: clients.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final client = clients[index];

              return StreamBuilder<double>(
                stream: _getTotal(client.id, 'savings'),
                builder: (context, savingsSnap) {
                  final savings = savingsSnap.data ?? 0.0;

                  return StreamBuilder<double>(
                    stream: _getTotal(client.id, 'interest_income'),
                    builder: (context, interestSnap) {
                      final interest = interestSnap.data ?? 0.0;

                      return StreamBuilder<double>(
                        stream: _getTotal(client.id, 'costs'),
                        builder: (context, costSnap) {
                          final costs = costSnap.data ?? 0.0;

                          // ✅ CORRECT VSLA RULES
                          final personalInterest = interest / 2;
                          final groupInterest = interest;

                          final shareOut =
                              savings +
                              personalInterest +
                              groupInterest -
                              costs;

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    client.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  _row('Savings', savings),
                                  _row('Personal Interest', personalInterest),
                                  _row('Group Interest', groupInterest),
                                  _row('Costs', -costs),

                                  const Divider(height: 20),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'TOTAL SHARE OUT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _currency.format(shareOut),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: shareOut >= 0
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _row(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            _currency.format(value),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
