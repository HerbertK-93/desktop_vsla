import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';

class PenaltiesScreen extends StatelessWidget {
  const PenaltiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Penalties")),
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
                  subtitle: const Text("Tap to view penalty records"),
                  children: [
                    StreamBuilder<List<Penalty>>(
                      stream: (database.select(database.penalties)
                            ..where((p) => p.clientId.equals(client.id)))
                          .watch(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          );
                        }

                        final penalties = snapshot.data!;
                        if (penalties.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No penalty records."),
                          );
                        }

                        return Column(
                          children: penalties.map((p) {
                            final date = p.penaltyDate
                                .toLocal()
                                .toString()
                                .split(' ')[0];
                            return ListTile(
                              leading: const Icon(Icons.warning_amber_rounded),
                              title: Text("Reason: ${p.reason}"),
                              subtitle: Text(
                                  "Amount: \$${p.amount.toStringAsFixed(2)}\nDate: $date"),
                              isThreeLine: true,
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
