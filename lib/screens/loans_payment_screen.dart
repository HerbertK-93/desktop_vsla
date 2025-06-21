import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';

class LoansPaymentScreen extends StatelessWidget {
  const LoansPaymentScreen({super.key});

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
                  subtitle: const Text("Tap to view loan payments"),
                  children: [
                    FutureBuilder<List<Loan>>(
                      future: (database.select(database.loans)
                            ..where((l) => l.clientId.equals(client.id)))
                          .get(),
                      builder: (context, loanSnap) {
                        if (!loanSnap.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          );
                        }

                        final loans = loanSnap.data!;
                        if (loans.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No loans found for this client."),
                          );
                        }

                        return Column(
                          children: loans.map((loan) {
                            return StreamBuilder<List<LoanPayment>>(
                              stream: (database.select(database.loanPayments)
                                    ..where((p) => p.loanId.equals(loan.id)))
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
                                  return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                        "No payments found for Loan ID: ${loan.id}"),
                                  );
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Loan ID: ${loan.id}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ...payments.map((p) {
                                      final date = p.paymentDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0];
                                      return ListTile(
                                        leading:
                                            const Icon(Icons.payments_outlined),
                                        title: Text(
                                            "\$${p.amount.toStringAsFixed(2)}"),
                                        subtitle: Text("Date: $date"),
                                      );
                                    }).toList(),
                                  ],
                                );
                              },
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
