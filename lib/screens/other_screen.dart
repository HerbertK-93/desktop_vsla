import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vsla_desktop/main.dart';
import 'package:vsla_desktop/database/database.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({super.key});

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  final List<List<TextEditingController>> _subscriptionRows = [];
  final List<List<TextEditingController>> _interestIncomeRows = [];
  final List<List<TextEditingController>> _investmentRows = [];
  final List<List<TextEditingController>> _costRows = [];

  void _addRow(List<List<TextEditingController>> list, int columns) {
    setState(() {
      list.add(List.generate(columns, (_) => TextEditingController()));
    });
  }

  void _removeRow(List<List<TextEditingController>> list) {
    if (list.isNotEmpty) {
      setState(() {
        list.removeLast();
      });
    }
  }

  TableRow _buildHeaderRow(List<String> headers) {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
      children: headers
          .map((header) => Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  header,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildEditableRow(List<TextEditingController> controllers,
      {bool isCostRow = false}) {
    return TableRow(
      children: List.generate(controllers.length, (index) {
        final isDateField =
            (isCostRow && index == 0) || (!isCostRow && index == 0);
        if (isDateField) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  controllers[index].text =
                      "${pickedDate.toLocal()}".split(' ')[0];
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: controllers[index],
                  decoration: const InputDecoration(
                    hintText: 'Select Date',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: TextField(
              controller: controllers[index],
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> headers,
    required List<List<TextEditingController>> rows,
    required VoidCallback onAdd,
    required VoidCallback onClear,
    required VoidCallback onSave,
    bool isCostSection = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
              ...rows
                  .map(
                    (r) => _buildEditableRow(
                      r,
                      isCostRow: isCostSection,
                    ),
                  )
                  .toList(),
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
            child: ElevatedButton(
              onPressed: onSave,
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Others')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildSection(
              title: "➕ Subscription",
              headers: ["DATE", "AMOUNT"],
              rows: _subscriptionRows,
              onAdd: () => _addRow(_subscriptionRows, 2),
              onClear: () => _removeRow(_subscriptionRows),
              onSave: () async {
                for (var row in _subscriptionRows) {
                  if (row[0].text.isNotEmpty && row[1].text.isNotEmpty) {
                    await database.into(database.subscriptions).insert(
                          SubscriptionsCompanion(
                            date: drift.Value(DateTime.parse(row[0].text)),
                            amount:
                                drift.Value(double.tryParse(row[1].text) ?? 0),
                          ),
                        );
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Subscriptions saved")),
                );
              },
            ),
            _buildSection(
              title: "➕ Interest Income",
              headers: ["DATE", "AMOUNT"],
              rows: _interestIncomeRows,
              onAdd: () => _addRow(_interestIncomeRows, 2),
              onClear: () => _removeRow(_interestIncomeRows),
              onSave: () async {
                for (var row in _interestIncomeRows) {
                  if (row[0].text.isNotEmpty && row[1].text.isNotEmpty) {
                    await database.into(database.interestIncome).insert(
                          InterestIncomeCompanion(
                            date: drift.Value(DateTime.parse(row[0].text)),
                            amount:
                                drift.Value(double.tryParse(row[1].text) ?? 0),
                          ),
                        );
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Interest Income saved")),
                );
              },
            ),
            _buildSection(
              title: "➕ Investments",
              headers: ["DATE", "AMOUNT"],
              rows: _investmentRows,
              onAdd: () => _addRow(_investmentRows, 2),
              onClear: () => _removeRow(_investmentRows),
              onSave: () async {
                for (var row in _investmentRows) {
                  if (row[0].text.isNotEmpty && row[1].text.isNotEmpty) {
                    await database.into(database.investments).insert(
                          InvestmentsCompanion(
                            date: drift.Value(DateTime.parse(row[0].text)),
                            amount:
                                drift.Value(double.tryParse(row[1].text) ?? 0),
                          ),
                        );
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Investments saved")),
                );
              },
            ),
            _buildSection(
              title: "➕ Cost Component",
              headers: ["DATE", "TYPE", "PURPOSE", "AMOUNT"],
              rows: _costRows,
              isCostSection: true,
              onAdd: () => _addRow(_costRows, 4),
              onClear: () => _removeRow(_costRows),
              onSave: () async {
                for (var row in _costRows) {
                  if (row[0].text.isNotEmpty &&
                      row[1].text.isNotEmpty &&
                      row[2].text.isNotEmpty &&
                      row[3].text.isNotEmpty) {
                    await database.into(database.costs).insert(
                          CostsCompanion(
                            date: drift.Value(DateTime.parse(row[0].text)),
                            type: drift.Value(row[1].text),
                            purpose: drift.Value(row[2].text),
                            amount:
                                drift.Value(double.tryParse(row[3].text) ?? 0),
                          ),
                        );
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cost Component saved")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
