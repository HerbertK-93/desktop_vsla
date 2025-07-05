import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import 'package:vsla_desktop/screens/edit_client_screen.dart';
import 'package:vsla_desktop/screens/other_screen.dart';
import '../database/database.dart';
import '../../main.dart';

class UserDetailsScreen extends StatefulWidget {
  final Client client;
  const UserDetailsScreen({required this.client});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _currencyFormatter = NumberFormat.currency(
    locale: 'en_UG',
    symbol: 'UGX ',
  );
  final List<List<TextEditingController>> _loansRows = [];
  final List<List<TextEditingController>> _loanPaymentsRows = [];
  final List<List<TextEditingController>> _savingsRows = [];
  final List<List<TextEditingController>> _penaltyRows = [];
  final List<List<TextEditingController>> _welfareRows = [];

  bool _hoveringOthers = false;
  Client? _client;

  @override
  void initState() {
    super.initState();
    _client = widget.client;
  }

  Future<void> _loadExistingLoans() async {
    _loansRows.clear();
    final clientLoans = await (database.select(
      database.loans,
    )..where((loan) => loan.clientId.equals(_client!.id))).get();

    for (var loan in clientLoans) {
      final dateController = TextEditingController(
        text: loan.issuedDate.toIso8601String().split('T').first,
      );
      final amountController = TextEditingController(
        text: loan.amount.toStringAsFixed(2),
      );
      final interestController = TextEditingController(
        text: loan.interest.toStringAsFixed(2),
      );
      final totalController = TextEditingController(
        text: loan.totalToPay.toStringAsFixed(2),
      );

      _loansRows.add([
        dateController,
        amountController,
        interestController,
        totalController,
      ]);
    }

    setState(() {});
  }

  void _addRow(
    List<List<TextEditingController>> list,
    int columns, {
    bool isLoan = false,
    bool isLoanPayment = false,
  }) {
    final row = List.generate(columns, (_) => TextEditingController());

    if (isLoan) {
      row[1].addListener(() {
        final amount = double.tryParse(row[1].text.trim());
        if (amount != null) {
          final interest = amount * 0.30;
          final total = amount + interest;
          row[2].text = interest.toStringAsFixed(2);
          row[3].text = total.toStringAsFixed(2);
        } else {
          row[2].clear();
          row[3].clear();
        }
      });
    }

    if (isLoanPayment) {
      void updateRemaining() {
        final total = double.tryParse(row[2].text.trim());
        final paid = double.tryParse(row[3].text.trim());
        if (total != null && paid != null) {
          row[4].text = (total - paid).toStringAsFixed(2);
        }
      }

      row[2].addListener(updateRemaining);
      row[3].addListener(updateRemaining);
    }

    setState(() => list.add(row));
  }

  void _removeRow(List<List<TextEditingController>> list) {
    if (list.isNotEmpty) setState(() => list.removeLast());
  }

  TableRow _buildHeaderRow(List<String> headers) {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
      children: headers.map((text) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  TableRow _buildEditableRow(List<TextEditingController> controllers) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: controllers.asMap().entries.map((entry) {
        final index = entry.key;
        final ctrl = entry.value;
        final isDateField = index == 0;

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: isDateField
              ? GestureDetector(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      ctrl.text = picked.toIso8601String().split('T')[0];
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: ctrl,
                      decoration: const InputDecoration(
                        hintText: 'Pick Date',
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                )
              : TextField(
                  controller: ctrl,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
        );
      }).toList(),
    );
  }

  Widget _buildStyledTable({
    required String title,
    required List<String> headers,
    required List<List<TextEditingController>> rows,
    required VoidCallback onAdd,
    required VoidCallback onClear,
    required VoidCallback onSave,
    required VoidCallback onPrint,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.print),
              tooltip: "Print $title",
              onPressed: onPrint,
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.all(12),
        children: [
          Table(
            border: TableBorder.all(color: Colors.black45),
            columnWidths: {
              for (int i = 0; i < headers.length; i++)
                i: const FlexColumnWidth(2),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildHeaderRow(headers),
              ...rows.map(_buildEditableRow),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Row"),
                onPressed: onAdd,
              ),
              TextButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text("Clear Row"),
                onPressed: onClear,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(onPressed: onSave, child: const Text("Save")),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildClientInformation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow("Name", _client!.name),
                const Divider(),
                _buildInfoRow("Client ID", _client!.clientId),
                const Divider(),
                _buildInfoRow("ID Number", _client!.idNumber),
                const Divider(),
                _buildInfoRow("Contact", _client!.contact),
                const Divider(),
                _buildInfoRow("Address", _client!.address),
                const Divider(),
                _buildInfoRow(
                  "Date Created",
                  _client!.date.toLocal().toString().split(' ')[0],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit Client Info"),
                  onPressed: () async {
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditClientScreen(client: _client!),
                      ),
                    );
                    if (updated == true) {
                      final refreshed =
                          await (database.select(database.clients)
                                ..where((tbl) => tbl.id.equals(_client!.id)))
                              .getSingle();
                      setState(() => _client = refreshed);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: File(_client!.idImagePath).existsSync()
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(_client!.idImagePath),
                    fit: BoxFit.cover,
                  ),
                )
              : const Center(child: Text("No ID Image")),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Client Information",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            _buildClientInformation(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage Account",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hoveringOthers = true),
                  onExit: (_) => setState(() => _hoveringOthers = false),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OthersScreen()),
                    ),
                    child: Text(
                      "Others",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _hoveringOthers ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _buildStyledTable(
              title: "➕ Loans",
              headers: [
                "DATE",
                "AMOUNT TAKEN",
                "INTEREST (30%)",
                "TOTAL TO PAY",
              ],
              rows: _loansRows,
              onAdd: () => _addRow(_loansRows, 4, isLoan: true),
              onClear: () => _removeRow(_loansRows),
              onSave: () async {
                for (final row in _loansRows) {
                  if (row.every((ctrl) => ctrl.text.trim().isNotEmpty)) {
                    final date = DateTime.tryParse(row[0].text.trim());
                    final amount = double.tryParse(row[1].text.trim());
                    final interest = double.tryParse(row[2].text.trim());
                    final totalToPay = double.tryParse(row[3].text.trim());

                    if (date != null &&
                        amount != null &&
                        interest != null &&
                        totalToPay != null) {
                      await database
                          .into(database.loans)
                          .insert(
                            LoansCompanion(
                              clientId: drift.Value(widget.client.id),
                              issuedDate: drift.Value(date),
                              amount: drift.Value(amount),
                              interest: drift.Value(interest),
                              totalToPay: drift.Value(totalToPay),
                            ),
                          );
                    }
                  }
                }

                // ✅ Only remove rows you just saved
                _loansRows.removeWhere(
                  (row) => row.every((ctrl) => ctrl.text.trim().isNotEmpty),
                );

                setState(() {
                  _loansRows.clear();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Loans saved successfully")),
                );
              },
              onPrint: () => print("Printing Loans Ledger..."),
            ),

            // ➕ Loan Payments
            _buildStyledTable(
              title: "➕ Loan Payments",
              headers: [
                "DATE", // <-- moved to first
                "PAYMENT NO",
                "TOTAL TO PAY",
                "AMOUNT PAID",
                "REMAINING BALANCE",
              ],
              rows: _loanPaymentsRows,
              onAdd: () => _addRow(_loanPaymentsRows, 5, isLoanPayment: true),
              onClear: () => _removeRow(_loanPaymentsRows),
              onSave: () async {
                for (final row in _loanPaymentsRows) {
                  final dateText = row[0].text.trim(); // DATE
                  final paymentNo = row[1].text.trim(); // PAYMENT NO
                  final totalText = row[2].text.trim(); // TOTAL TO PAY
                  final amountPaidText = row[3].text.trim(); // AMOUNT PAID
                  final remainingText = row[4].text.trim(); // REMAINING BALANCE

                  final date = DateTime.tryParse(dateText);
                  final totalToPay = double.tryParse(totalText);
                  final amountPaid = double.tryParse(amountPaidText);
                  final remainingBalance = double.tryParse(remainingText);

                  if (date != null &&
                      paymentNo.isNotEmpty &&
                      totalToPay != null &&
                      amountPaid != null &&
                      remainingBalance != null) {
                    await database
                        .into(database.loanPayments)
                        .insert(
                          LoanPaymentsCompanion(
                            clientId: drift.Value(widget.client.id),
                            paymentDate: drift.Value(date),
                            paymentNo: drift.Value(paymentNo),
                            totalToPay: drift.Value(totalToPay),
                            amount: drift.Value(amountPaid),
                            remainingBalance: drift.Value(remainingBalance),
                          ),
                        );
                  }
                }
                setState(() {
                  _loansRows.clear();
                });

                _loanPaymentsRows.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Loan Payments saved successfully"),
                  ),
                );
              },
              onPrint: () => print("Printing Loan Payments..."),
            ),

            // ➕ Savings
            _buildStyledTable(
              title: "➕ Savings",
              headers: ["DATE", "SAVING NO (weekly)", "AMOUNT"],
              rows: _savingsRows,
              onAdd: () => _addRow(_savingsRows, 3),
              onClear: () => _removeRow(_savingsRows),
              onSave: () async {
                for (final row in _savingsRows) {
                  if (row.every((ctrl) => ctrl.text.trim().isNotEmpty)) {
                    final date = DateTime.tryParse(row[0].text.trim());
                    final savingNo = row[1].text.trim();
                    final amount = double.tryParse(row[2].text.trim());

                    if (date != null && amount != null && savingNo.isNotEmpty) {
                      await database
                          .into(database.savings)
                          .insert(
                            SavingsCompanion(
                              clientId: drift.Value(widget.client.id),
                              savingDate: drift.Value(date),
                              savingNo: drift.Value(savingNo),
                              amount: drift.Value(amount),
                            ),
                          );
                    }
                  }
                }

                setState(() {
                  _savingsRows.clear(); // 🔥 This clears table from UI
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Savings saved")));
              },

              onPrint: () => print("Printing Savings Ledger..."),
            ),

            // ➕ Welfare
            _buildStyledTable(
              title: "➕ Welfare",
              headers: ["DATE", "WELFARE NO", "AMOUNT"],
              rows: _welfareRows,
              onAdd: () => _addRow(_welfareRows, 3),
              onClear: () => _removeRow(_welfareRows),
              onSave: () async {
                for (final row in _welfareRows) {
                  if (row.every((ctrl) => ctrl.text.trim().isNotEmpty)) {
                    final date = DateTime.tryParse(row[0].text.trim());
                    final welfareNo = row[1].text.trim();
                    final amount = double.tryParse(row[2].text.trim());

                    if (date != null &&
                        amount != null &&
                        welfareNo.isNotEmpty) {
                      await database
                          .into(database.welfares)
                          .insert(
                            WelfaresCompanion(
                              clientId: drift.Value(widget.client.id),
                              date: drift.Value(date),
                              welfareNo: drift.Value(welfareNo),
                              amount: drift.Value(amount),
                            ),
                          );
                    }
                  }
                }

                setState(() {
                  _welfareRows.clear();
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Welfare saved")));
              },
              onPrint: () => print("Printing Welfare Ledger..."),
            ),

            // ➕ Penalties
            _buildStyledTable(
              title: "➕ Penalties",
              headers: ["DATE", "PENALTY NO", "AMOUNT"],
              rows: _penaltyRows,
              onAdd: () => _addRow(_penaltyRows, 3),
              onClear: () => _removeRow(_penaltyRows),
              onSave: () async {
                for (final row in _penaltyRows) {
                  if (row.every((ctrl) => ctrl.text.trim().isNotEmpty)) {
                    final date = DateTime.tryParse(row[0].text.trim());
                    final penaltyNo = row[1].text.trim();
                    final amount = double.tryParse(row[2].text.trim());

                    if (date != null &&
                        amount != null &&
                        penaltyNo.isNotEmpty) {
                      await database
                          .into(database.penalties)
                          .insert(
                            PenaltiesCompanion(
                              clientId: drift.Value(widget.client.id),
                              penaltyDate: drift.Value(date),
                              penaltyNo: drift.Value(penaltyNo),
                              amount: drift.Value(amount),
                            ),
                          );
                    }
                  }
                }

                // ✅ Ensure rows clear no matter what
                setState(() {
                  _penaltyRows.clear();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Penalties saved")),
                );
              },

              onPrint: () => print("Printing Penalties Ledger..."),
            ),
          ],
        ),
      ),
    );
  }
}
