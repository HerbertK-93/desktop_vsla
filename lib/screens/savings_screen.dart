import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

  String _formatCurrency(double? value) {
    if (value == null) return 'UGX 0.00';
    return 'UGX ${value.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Savings")),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, clientSnapshot) {
          if (!clientSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = clientSnapshot.data!;
          if (clients.isEmpty) {
            return const Center(child: Text("No savings records found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];

              return StreamBuilder<List<Saving>>(
                stream: (database.select(database.savings)
                      ..where((s) => s.clientId.equals(client.id)))
                    .watch(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final savings = snapshot.data!;

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      title: Text("${client.name} (ID: ${client.clientId})",
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: const Text("Tap to view savings records"),
                      children: [
                        if (savings.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No savings records found"),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FlexColumnWidth(2), // Date
                                1: FlexColumnWidth(2), // Saving No
                                2: FlexColumnWidth(2), // Amount
                              },
                              children: [
                                const TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.black12),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Saving No",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Amount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                ...savings.map((saving) {
                                  final dateStr = saving.savingDate
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];

                                  return TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(dateStr),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(saving.savingNo ?? "N/A"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            _formatCurrency(saving.amount)),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    UserDetailsScreen(client: client)),
                          ),
                          child: const Text("View Full Client Details"),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
