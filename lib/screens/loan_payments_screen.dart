import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;

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
                  title: Text(
                    "${client.name} (ID: ${client.clientId})",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Tap to view loan payments"),
                  children: [
                    StreamBuilder<List<LoanPayment>>(
                      stream:
                          (database.select(
                                database.loanPayments,
                              )..where((tbl) => tbl.clientId.equals(client.id)))
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
                              5: FlexColumnWidth(1), // Save button
                            },
                            children: [
                              const TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Payment No",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Total To Pay",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Amount Paid",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Remaining",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(""),
                                  ),
                                ],
                              ),
                              ...payments.map((p) {
                                final dateStr = p.paymentDate
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0];

                                final paymentNoController =
                                    TextEditingController(
                                      text: p.paymentNo ?? "",
                                    );
                                final totalController = TextEditingController(
                                  text: p.totalToPay.toString(),
                                );
                                final amountController = TextEditingController(
                                  text: p.amount.toString(),
                                );
                                final remainingController =
                                    TextEditingController(
                                      text: p.remainingBalance.toString(),
                                    );

                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(dateStr),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: paymentNoController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: totalController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: amountController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: remainingController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.save,
                                          color: Colors.green,
                                        ),
                                        onPressed: () async {
                                          try {
                                            final newPaymentNo =
                                                paymentNoController.text.trim();
                                            final newTotal =
                                                double.tryParse(
                                                  totalController.text.trim(),
                                                ) ??
                                                0;
                                            final newAmount =
                                                double.tryParse(
                                                  amountController.text.trim(),
                                                ) ??
                                                0;
                                            final newRemaining =
                                                double.tryParse(
                                                  remainingController.text
                                                      .trim(),
                                                ) ??
                                                0;

                                            await (database.update(
                                                  database.loanPayments,
                                                )..where(
                                                  (tbl) => tbl.id.equals(p.id),
                                                ))
                                                .write(
                                                  LoanPaymentsCompanion(
                                                    paymentNo: Value(
                                                      newPaymentNo,
                                                    ),
                                                    totalToPay: Value(newTotal),
                                                    amount: Value(newAmount),
                                                    remainingBalance: Value(
                                                      newRemaining,
                                                    ),
                                                  ),
                                                );

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  '✅ Payment updated successfully',
                                                ),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          } catch (e) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text('Error: $e'),
                                                duration: const Duration(
                                                  seconds: 2,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
