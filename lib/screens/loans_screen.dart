import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loans")),
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
                  subtitle: const Text("Tap to view loan records"),
                  children: [
                    // Load loans for this client
                    StreamBuilder<List<Loan>>(
                      stream: (database.select(database.loans)
                            ..where((l) => l.clientId.equals(client.id)))
                          .watch(),
                      builder: (context, loanSnapshot) {
                        if (!loanSnapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          );
                        }

                        final loans = loanSnapshot.data!;
                        if (loans.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No loan records"),
                          );
                        }

                        return Column(
                          children: loans.map((loan) {
                            // Format date nicely
                            final dateStr = loan.issuedDate
                                .toLocal()
                                .toString()
                                .split(' ')[0];

                            return ListTile(
                              leading: const Icon(Icons.request_quote_outlined),
                              title: Text(
                                  "Loan No: ${loan.id}"), // or use your own loan number
                              subtitle: Text(
                                  "Date: $dateStr\nAmount: \$${loan.amount.toStringAsFixed(2)}"),
                              isThreeLine: true,
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserDetailsScreen(client: client)),
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
      ),
    );
  }
}
