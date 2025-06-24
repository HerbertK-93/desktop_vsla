import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class LoanPaymentsScreen extends StatelessWidget {
  const LoanPaymentsScreen({super.key});

  String _formatCurrency(double? value) {
    if (value == null) return 'UGX 0.00';
    return 'UGX ${value.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loan Payments")),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, clientSnapshot) {
          if (!clientSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = clientSnapshot.data!;
          if (clients.isEmpty) {
            return const Center(child: Text("No payments found"));
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
                  subtitle: const Text("Tap to view loan payments"),
                  children: [
                    StreamBuilder<List<LoanPayment>>(
                      stream: (database.select(database.loanPayments)
                            ..where((tbl) => tbl.clientId.equals(client.id)))
                          .watch(),
                      builder: (context, paymentSnap) {
                        if (!paymentSnap.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          );
                        }

                        final payments = paymentSnap.data!;
                        if (payments.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No payments found."),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Table(
                            border: TableBorder.all(color: Colors.black26),
                            columnWidths: const {
                              0: FlexColumnWidth(2), // Date
                              1: FlexColumnWidth(2), // Payment No
                              2: FlexColumnWidth(2), // Total To Pay
                              3: FlexColumnWidth(2), // Amount Paid
                              4: FlexColumnWidth(2), // Remaining Balance
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
                                    child: Text("Payment No",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Total To Pay",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Amount Paid",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Remaining",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              ...payments.map((p) {
                                final dateStr = p.paymentDate
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
                                      child: Text(p.paymentNo ?? "N/A"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child:
                                          Text(_formatCurrency(p.totalToPay)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(_formatCurrency(p.amount)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                          _formatCurrency(p.remainingBalance)),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        );
                      },
                    ),
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
