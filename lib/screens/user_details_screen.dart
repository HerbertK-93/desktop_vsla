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
  const UserDetailsScreen({required this.client, Key? key}) : super(key: key);

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

  final TextEditingController _repaymentDateController =
      TextEditingController();
  final List<Map<String, TextEditingController>> _guarantors = List.generate(
    3,
    (_) => {'name': TextEditingController(), 'nin': TextEditingController()},
  );

  String? _selectedInterestOption;
  bool _hoveringOthers = false;
  Client? _client;

  @override
  void initState() {
    super.initState();
    _client = widget.client;
  }

  // ✅ FIXED FUNCTION: removed interest field
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
      final totalController = TextEditingController(
        text: loan.totalToPay.toStringAsFixed(2),
      );

      _loansRows.add([dateController, amountController, totalController]);
    }

    setState(() {});
  }

  // ✅ FIXED FUNCTION: removed interest calculations
  void _addRow(
    List<List<TextEditingController>> list,
    int columns, {
    bool isLoan = false,
    bool isLoanPayment = false,
  }) {
    final row = List.generate(columns, (_) => TextEditingController());

    if (isLoanPayment && columns > 4) {
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
      decoration: BoxDecoration(color: Colors.grey.shade300),
      children: headers
          .map(
            (text) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  TableRow _buildEditableRow(
    List<TextEditingController> controllers,
    int index, {
    bool shaded = false,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: shaded ? Colors.grey.shade100 : Colors.white,
      ),
      children: controllers.asMap().entries.map((entry) {
        final idx = entry.key;
        final ctrl = entry.value;
        final isDateField = idx == 0;

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
    Widget? extraFields,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
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
            border: TableBorder.all(color: Colors.black26),
            columnWidths: {
              for (int i = 0; i < headers.length; i++)
                i: const FlexColumnWidth(2),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildHeaderRow(headers),
              ...rows.asMap().entries.map(
                (e) => _buildEditableRow(e.value, e.key, shaded: e.key.isEven),
              ),
            ].toList(),
          ),
          const SizedBox(height: 12),
          if (extraFields != null) extraFields,
          const SizedBox(height: 12),
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OthersScreen(clientId: _client!.id),
                        ),
                      );
                    },
                    child: const Text(
                      "Others",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 💰 LOANS SECTION — interest rate checkboxes now HORIZONTAL and INSIDE the Loans section fold
            _buildStyledTable(
              title: "➕ Loans",
              headers: ["DATE", "AMOUNT TAKEN", "TOTAL TO PAY"],
              rows: _loansRows,
              onAdd: () {
                final row = List.generate(3, (_) => TextEditingController());
                // Auto-update total when amount changes
                row[1].addListener(() {
                  final amount = double.tryParse(row[1].text.trim());
                  if (amount != null && _selectedInterestOption != null) {
                    const rates = {
                      "10% for 1 month": 0.10,
                      "20% for 2 months": 0.20,
                      "30% for 3 months": 0.30,
                    };
                    final rate = rates[_selectedInterestOption] ?? 0.0;
                    row[2].text = (amount * (1 + rate)).toStringAsFixed(2);
                  }
                });
                setState(() => _loansRows.add(row));
              },
              onClear: () => _removeRow(_loansRows),
              onSave: () async {
                if (_loansRows.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No loans to save")),
                  );
                  return;
                }

                try {
                  for (final row in _loansRows) {
                    if (row.every((ctrl) => ctrl.text.trim().isNotEmpty)) {
                      final date = DateTime.tryParse(row[0].text.trim());
                      final amount = double.tryParse(row[1].text.trim());
                      final totalToPay = double.tryParse(row[2].text.trim());
                      final repaymentDate = DateTime.tryParse(
                        _repaymentDateController.text.trim(),
                      );

                      if (date != null &&
                          amount != null &&
                          totalToPay != null) {
                        await database
                            .into(database.loans)
                            .insert(
                              LoansCompanion(
                                clientId: drift.Value(widget.client.id),
                                issuedDate: drift.Value(date),
                                amount: drift.Value(amount),
                                totalToPay: drift.Value(totalToPay),
                                interest: drift.Value(
                                  _selectedInterestOption == "10% for 1 month"
                                      ? 10
                                      : _selectedInterestOption ==
                                            "20% for 2 months"
                                      ? 20
                                      : _selectedInterestOption ==
                                            "30% for 3 months"
                                      ? 30
                                      : 0,
                                ),
                                interestType: drift.Value(
                                  _selectedInterestOption ?? "Unspecified",
                                ),
                                repaymentDate: drift.Value(
                                  repaymentDate ?? DateTime.now(),
                                ),
                                guarantor1Name: drift.Value(
                                  _guarantors[0]['name']!.text.trim(),
                                ),
                                guarantor1NIN: drift.Value(
                                  _guarantors[0]['nin']!.text.trim(),
                                ),
                                guarantor2Name: drift.Value(
                                  _guarantors[1]['name']!.text.trim(),
                                ),
                                guarantor2NIN: drift.Value(
                                  _guarantors[1]['nin']!.text.trim(),
                                ),
                                guarantor3Name: drift.Value(
                                  _guarantors[2]['name']!.text.trim(),
                                ),
                                guarantor3NIN: drift.Value(
                                  _guarantors[2]['nin']!.text.trim(),
                                ),
                              ),
                            );
                      }
                    }
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("✅ Loan saved successfully")),
                  );

                  setState(() {
                    _loansRows.clear();
                    _repaymentDateController.clear();
                    for (final g in _guarantors) {
                      g['name']!.clear();
                      g['nin']!.clear();
                    }
                    _selectedInterestOption = null;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error saving loan: $e")),
                  );
                }
              },

              onPrint: () => print("Printing Loans Ledger..."),
              extraFields: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    "Select Interest Rate:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  // 💡 Horizontal interest options row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text("10% for 1 month"),
                          value: "10% for 1 month",
                          groupValue: _selectedInterestOption,
                          onChanged: (value) {
                            setState(() => _selectedInterestOption = value);
                            const rates = {
                              "10% for 1 month": 0.10,
                              "20% for 2 months": 0.20,
                              "30% for 3 months": 0.30,
                            };
                            final rate = rates[value] ?? 0.0;
                            for (final row in _loansRows) {
                              final amount = double.tryParse(
                                row[1].text.trim(),
                              );
                              if (amount != null) {
                                row[2].text = (amount * (1 + rate))
                                    .toStringAsFixed(2);
                              }
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text("20% for 2 months"),
                          value: "20% for 2 months",
                          groupValue: _selectedInterestOption,
                          onChanged: (value) {
                            setState(() => _selectedInterestOption = value);
                            const rates = {
                              "10% for 1 month": 0.10,
                              "20% for 2 months": 0.20,
                              "30% for 3 months": 0.30,
                            };
                            final rate = rates[value] ?? 0.0;
                            for (final row in _loansRows) {
                              final amount = double.tryParse(
                                row[1].text.trim(),
                              );
                              if (amount != null) {
                                row[2].text = (amount * (1 + rate))
                                    .toStringAsFixed(2);
                              }
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text("30% for 3 months"),
                          value: "30% for 3 months",
                          groupValue: _selectedInterestOption,
                          onChanged: (value) {
                            setState(() => _selectedInterestOption = value);
                            const rates = {
                              "10% for 1 month": 0.10,
                              "20% for 2 months": 0.20,
                              "30% for 3 months": 0.30,
                            };
                            final rate = rates[value] ?? 0.0;
                            for (final row in _loansRows) {
                              final amount = double.tryParse(
                                row[1].text.trim(),
                              );
                              if (amount != null) {
                                row[2].text = (amount * (1 + rate))
                                    .toStringAsFixed(2);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Date of Repayment:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _repaymentDateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: "Pick repayment date",
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        _repaymentDateController.text = picked
                            .toIso8601String()
                            .split('T')[0];
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Guarantors (Up to 3):",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(3, (i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _guarantors[i]['name'],
                              decoration: InputDecoration(
                                labelText: "Guarantor ${i + 1} Name",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _guarantors[i]['nin'],
                              decoration: InputDecoration(
                                labelText: "Guarantor ${i + 1} NIN",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),

            // ➕ Loan Payments
            _buildStyledTable(
              title: "➕ Loan Payments",
              headers: [
                "DATE",
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
                  final date = DateTime.tryParse(row[0].text.trim());
                  final paymentNo = row[1].text.trim();
                  final totalToPay = double.tryParse(row[2].text.trim());
                  final amountPaid = double.tryParse(row[3].text.trim());
                  final remaining = double.tryParse(row[4].text.trim());
                  if (date != null &&
                      paymentNo.isNotEmpty &&
                      totalToPay != null &&
                      amountPaid != null &&
                      remaining != null) {
                    await database
                        .into(database.loanPayments)
                        .insert(
                          LoanPaymentsCompanion(
                            clientId: drift.Value(widget.client.id),
                            paymentDate: drift.Value(date),
                            paymentNo: drift.Value(paymentNo),
                            totalToPay: drift.Value(totalToPay),
                            amount: drift.Value(amountPaid),
                            remainingBalance: drift.Value(remaining),
                          ),
                        );
                    // ✅ RECORD INTEREST AS PROFIT
                    final interestEarned = totalToPay - amountPaid - remaining;

                    if (interestEarned > 0) {
                      await database
                          .into(database.interestIncome)
                          .insert(
                            InterestIncomeCompanion(
                              clientId: drift.Value(widget.client.id),
                              date: drift.Value(date),
                              amount: drift.Value(interestEarned),
                              source: drift.Value(
                                'Loan interest from payment $paymentNo',
                              ),
                            ),
                          );
                    }
                  }
                }

                setState(() => _loanPaymentsRows.clear());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Loan payments saved successfully"),
                  ),
                );
              },
              onPrint: () => print("Printing Loan Payments Ledger..."),
            ),

            // ➕ Savings
            _buildStyledTable(
              title: "➕ Savings",
              headers: ["DATE", "SAVING NO", "AMOUNT SAVED"],
              rows: _savingsRows,
              onAdd: () => _addRow(_savingsRows, 3),
              onClear: () => _removeRow(_savingsRows),
              onSave: () async {
                for (final row in _savingsRows) {
                  final date = DateTime.tryParse(row[0].text.trim());
                  final savingNo = row[1].text.trim();
                  final amount = double.tryParse(row[2].text.trim());
                  if (date != null && savingNo.isNotEmpty && amount != null) {
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

                setState(() => _savingsRows.clear());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Savings saved successfully")),
                );
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
                  final date = DateTime.tryParse(row[0].text.trim());
                  final welfareNo = row[1].text.trim();
                  final amount = double.tryParse(row[2].text.trim());
                  if (date != null && welfareNo.isNotEmpty && amount != null) {
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

                setState(() => _welfareRows.clear());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Welfare saved successfully")),
                );
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
                  final date = DateTime.tryParse(row[0].text.trim());
                  final penaltyNo = row[1].text.trim();
                  final amount = double.tryParse(row[2].text.trim());
                  if (date != null && penaltyNo.isNotEmpty && amount != null) {
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

                setState(() => _penaltyRows.clear());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Penalties saved successfully")),
                );
              },
              onPrint: () => print("Printing Penalties Ledger..."),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // dispose controllers to avoid leaks
    for (final row in _loansRows) {
      for (final c in row) {
        c.dispose();
      }
    }
    for (final row in _loanPaymentsRows) {
      for (final c in row) {
        c.dispose();
      }
    }
    for (final row in _savingsRows) {
      for (final c in row) {
        c.dispose();
      }
    }
    for (final row in _penaltyRows) {
      for (final c in row) {
        c.dispose();
      }
    }
    for (final row in _welfareRows) {
      for (final c in row) {
        c.dispose();
      }
    }
    _repaymentDateController.dispose();
    for (final g in _guarantors) {
      g['name']?.dispose();
      g['nin']?.dispose();
    }
    super.dispose();
  }
}
