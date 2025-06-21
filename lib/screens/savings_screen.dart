import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

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
            return const Center(child: Text("No clients found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: ExpansionTile(
                  title: Text("${client.name} (ID: ${client.clientId})",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text("Tap to view savings records"),
                  children: [
                    StreamBuilder<List<Saving>>(
                      stream: (database.select(database.savings)
                            ..where((s) => s.clientId.equals(client.id)))
                          .watch(),
                      builder: (context, savingSnap) {
                        if (!savingSnap.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          );
                        }

                        final savings = savingSnap.data!;
                        if (savings.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No savings records"),
                          );
                        }

                        return Column(
                          children: savings.map((s) {
                            final dateStr =
                                s.savingDate.toLocal().toString().split(' ')[0];

                            return ListTile(
                              leading: const Icon(Icons.savings_outlined),
                              title: Text("\$${s.amount.toStringAsFixed(2)}"),
                              subtitle: Text("Date: $dateStr"),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
