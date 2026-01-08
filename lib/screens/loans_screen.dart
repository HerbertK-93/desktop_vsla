import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Table, Column;

import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';
import '../utils/loan_utils.dart'; // ✅ ADDED (ONLY NEW IMPORT)

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

              return StreamBuilder<List<Loan>>(
                stream: (database.select(
                  database.loans,
                )..where((l) => l.clientId.equals(client.id))).watch(),
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

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "${client.name} (ID: ${client.clientId})",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text("Tap to view loan records"),
                      children: [
                        if (loans.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No loans found for this client"),
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
                                4: FlexColumnWidth(2),
                                5: FlexColumnWidth(2),
                                6: FlexColumnWidth(1),
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
                                        "Issued Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Repayment Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Amount",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Interest (%)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Total to Pay",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Interest Type",
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
                                ...loans.map((loan) {
                                  final issuedDate = loan.issuedDate
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];

                                  final repayDate = loan.repaymentDate != null
                                      ? loan.repaymentDate!
                                            .toLocal()
                                            .toString()
                                            .split(' ')[0]
                                      : '';

                                  // ✅ OVERDUE LOGIC (ONLY ADDITION)
                                  final isOverdue = isLoanOverdue(
                                    repaymentDate: loan.repaymentDate,
                                    remainingBalance: loan.totalToPay,
                                  );

                                  final amountController =
                                      TextEditingController(
                                        text: loan.amount.toString(),
                                      );
                                  final interestController =
                                      TextEditingController(
                                        text: loan.interest?.toString() ?? '',
                                      );
                                  final totalController = TextEditingController(
                                    text: loan.totalToPay?.toString() ?? '',
                                  );
                                  final interestTypeController =
                                      TextEditingController(
                                        text: loan.interestType ?? '',
                                      );

                                  return TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          issuedDate,
                                          style: TextStyle(
                                            color: isOverdue
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: isOverdue
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          repayDate.isEmpty ? 'N/A' : repayDate,
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
                                          controller: interestController,
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
                                          controller: interestTypeController,
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
                                              await (database.update(
                                                    database.loans,
                                                  )..where(
                                                    (tbl) =>
                                                        tbl.id.equals(loan.id),
                                                  ))
                                                  .write(
                                                    LoansCompanion(
                                                      amount: Value(
                                                        double.tryParse(
                                                              amountController
                                                                  .text,
                                                            ) ??
                                                            0,
                                                      ),
                                                      interest: Value(
                                                        double.tryParse(
                                                              interestController
                                                                  .text,
                                                            ) ??
                                                            0,
                                                      ),
                                                      totalToPay: Value(
                                                        double.tryParse(
                                                              totalController
                                                                  .text,
                                                            ) ??
                                                            0,
                                                      ),
                                                      interestType: Value(
                                                        interestTypeController
                                                            .text
                                                            .trim(),
                                                      ),
                                                    ),
                                                  );

                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    '✅ Loan updated successfully',
                                                  ),
                                                ),
                                              );
                                            } catch (e) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text('Error: $e'),
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
                          ),
                        const SizedBox(height: 8),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Guarantors:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildGuarantorTile(
                                1,
                                loans.isNotEmpty
                                    ? loans.first.guarantor1Name
                                    : null,
                                loans.isNotEmpty
                                    ? loans.first.guarantor1NIN
                                    : null,
                              ),
                              _buildGuarantorTile(
                                2,
                                loans.isNotEmpty
                                    ? loans.first.guarantor2Name
                                    : null,
                                loans.isNotEmpty
                                    ? loans.first.guarantor2NIN
                                    : null,
                              ),
                              _buildGuarantorTile(
                                3,
                                loans.isNotEmpty
                                    ? loans.first.guarantor3Name
                                    : null,
                                loans.isNotEmpty
                                    ? loans.first.guarantor3NIN
                                    : null,
                              ),
                            ],
                          ),
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
          );
        },
      ),
    );
  }

  /// ✅ GUARANTOR WIDGET (UNCHANGED)
  Widget _buildGuarantorTile(int index, String? name, String? nin) {
    if ((name == null || name.isEmpty) && (nin == null || nin.isEmpty)) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            "• Guarantor $index: ",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Expanded(
            child: Text(
              "${name ?? 'N/A'} (NIN: ${nin ?? 'N/A'})",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
