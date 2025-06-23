import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

  String _formatCurrency(double? value) {
    if (value == null) return 'UGX 0.00';
    return 'UGX ${value.toStringAsFixed(2)}';
  }

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
              debugPrint(
                  "📡 Loaded client ID: ${client.id}, clientId: ${client.clientId}");

              return StreamBuilder<List<Loan>>(
                stream: (database.select(database.loans)
                      ..where((l) => l.clientId.equals(client.id)))
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

                  final loans = snapshot.data!;
                  debugPrint(
                      "📈 Loans for client ${client.id}: ${loans.length} record(s)");

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
                      subtitle: const Text("Tap to view loan records"),
                      children: [
                        if (loans.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No loan records"),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(2),
                                3: FlexColumnWidth(2),
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
                                      child: Text("Amount Taken",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Interest",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Total To Pay",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                ...loans.map((loan) {
                                  final dateStr = loan.issuedDate
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
                                        child:
                                            Text(_formatCurrency(loan.amount)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            _formatCurrency(loan.interest)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            _formatCurrency(loan.totalToPay)),
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
