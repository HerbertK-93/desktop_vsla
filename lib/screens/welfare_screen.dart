import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../database/database.dart';
import '../../main.dart';
import 'user_details_screen.dart';

class WelfareScreen extends StatelessWidget {
  const WelfareScreen({super.key});

  String _formatCurrency(double? value) {
    if (value == null) return 'UGX 0.00';
    return 'UGX ${value.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welfare")),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, clientSnapshot) {
          if (!clientSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = clientSnapshot.data!;
          if (clients.isEmpty) {
            return const Center(child: Text("No welfare records found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];

              return StreamBuilder<List<Welfare>>(
                stream: (database.select(
                  database.welfares,
                )..where((w) => w.clientId.equals(client.id))).watch(),
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

                  final welfareList = snapshot.data!;

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
                      subtitle: const Text("Tap to view welfare records"),
                      children: [
                        if (welfareList.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("No welfare records found"),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FlexColumnWidth(2), // Date
                                1: FlexColumnWidth(2), // Welfare No
                                2: FlexColumnWidth(2), // Amount
                                3: FlexColumnWidth(1), // Save button
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
                                        "Welfare No",
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
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                ...welfareList.map((welfare) {
                                  final dateStr = welfare.date
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];

                                  final welfareNoController =
                                      TextEditingController(
                                        text: welfare.welfareNo ?? "",
                                      );
                                  final amountController =
                                      TextEditingController(
                                        text: welfare.amount.toString(),
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
                                          controller: welfareNoController,
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
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.save,
                                            color: Colors.green,
                                          ),
                                          onPressed: () async {
                                            try {
                                              final newWelfareNo =
                                                  welfareNoController.text
                                                      .trim();
                                              final newAmount =
                                                  double.tryParse(
                                                    amountController.text
                                                        .trim(),
                                                  ) ??
                                                  0;

                                              await (database.update(
                                                    database.welfares,
                                                  )..where(
                                                    (tbl) => tbl.id.equals(
                                                      welfare.id,
                                                    ),
                                                  ))
                                                  .write(
                                                    WelfaresCompanion(
                                                      welfareNo: Value(
                                                        newWelfareNo,
                                                      ),
                                                      amount: Value(newAmount),
                                                    ),
                                                  );

                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    '✅ Welfare updated successfully',
                                                  ),
                                                  duration: Duration(
                                                    seconds: 2,
                                                  ),
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
}
