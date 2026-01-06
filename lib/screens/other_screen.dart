import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vsla_desktop/main.dart';
import 'package:vsla_desktop/database/database.dart';

class OthersScreen extends StatefulWidget {
  final int clientId;

  const OthersScreen({Key? key, required this.clientId}) : super(key: key);

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  final List<List<TextEditingController>> _subscriptionRows = [];
  final List<List<TextEditingController>> _interestIncomeRows = [];
  final List<List<TextEditingController>> _investmentRows = [];
  final List<List<TextEditingController>> _costRows = [];
  final List<List<TextEditingController>> _otherSavingsRows = [];
  final List<List<TextEditingController>> _membershipFeesRows = [];

  void _addRow(List<List<TextEditingController>> list, int columns) {
    setState(() {
      list.add(List.generate(columns, (_) => TextEditingController()));
    });
  }

  void _removeRow(List<List<TextEditingController>> list) {
    if (list.isNotEmpty) {
      setState(() => list.removeLast());
    }
  }

  TableRow _buildHeaderRow(List<String> headers) {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
      children: headers
          .map(
            (h) => Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                h,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
          .toList(),
    );
  }

  TableRow _buildEditableRow(List<TextEditingController> controllers) {
    return TableRow(
      children: List.generate(controllers.length, (index) {
        final isDate = index == 0;
        return Padding(
          padding: const EdgeInsets.all(4),
          child: isDate
              ? GestureDetector(
                  onTap: () async {
                    final d = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (d != null) {
                      controllers[index].text = DateFormat(
                        'yyyy-MM-dd',
                      ).format(d);
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
                )
              : TextField(
                  controller: controllers[index],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
        );
      }),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> headers,
    required List<List<TextEditingController>> rows,
    required VoidCallback onAdd,
    required VoidCallback onClear,
    required Future<void> Function() onSave,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        childrenPadding: const EdgeInsets.all(12),
        children: [
          Table(
            border: TableBorder.all(color: Colors.black45),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildHeaderRow(headers),
              for (final r in rows) _buildEditableRow(r),
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
              onPressed: () async {
                await onSave();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("$title saved")));
              },
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
                for (final r in _subscriptionRows) {
                  await database
                      .into(database.subscriptions)
                      .insert(
                        SubscriptionsCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          amount: drift.Value(double.tryParse(r[1].text) ?? 0),
                        ),
                      );
                }
                setState(() => _subscriptionRows.clear());
              },
            ),
            _buildSection(
              title: "➕ Interest Income",
              headers: ["DATE", "AMOUNT"],
              rows: _interestIncomeRows,
              onAdd: () => _addRow(_interestIncomeRows, 2),
              onClear: () => _removeRow(_interestIncomeRows),
              onSave: () async {
                for (final r in _interestIncomeRows) {
                  await database
                      .into(database.interestIncome)
                      .insert(
                        InterestIncomeCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          amount: drift.Value(double.tryParse(r[1].text) ?? 0),
                          source: const drift.Value('other'),
                        ),
                      );
                }
                setState(() => _interestIncomeRows.clear());
              },
            ),
            _buildSection(
              title: "➕ Investments",
              headers: ["DATE", "AMOUNT"],
              rows: _investmentRows,
              onAdd: () => _addRow(_investmentRows, 2),
              onClear: () => _removeRow(_investmentRows),
              onSave: () async {
                for (final r in _investmentRows) {
                  await database
                      .into(database.investments)
                      .insert(
                        InvestmentsCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          amount: drift.Value(double.tryParse(r[1].text) ?? 0),
                        ),
                      );
                }
                setState(() => _investmentRows.clear());
              },
            ),
            _buildSection(
              title: "➕ Cost Component",
              headers: ["DATE", "TYPE", "PURPOSE", "AMOUNT"],
              rows: _costRows,
              onAdd: () => _addRow(_costRows, 4),
              onClear: () => _removeRow(_costRows),
              onSave: () async {
                for (final r in _costRows) {
                  await database
                      .into(database.costs)
                      .insert(
                        CostsCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          type: drift.Value(r[1].text),
                          purpose: drift.Value(r[2].text),
                          amount: drift.Value(double.tryParse(r[3].text) ?? 0),
                        ),
                      );
                }
                setState(() => _costRows.clear());
              },
            ),
            _buildSection(
              title: "➕ Other Savings",
              headers: ["DATE", "AMOUNT"],
              rows: _otherSavingsRows,
              onAdd: () => _addRow(_otherSavingsRows, 2),
              onClear: () => _removeRow(_otherSavingsRows),
              onSave: () async {
                for (final r in _otherSavingsRows) {
                  await database
                      .into(database.otherSavings)
                      .insert(
                        OtherSavingsCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          amount: drift.Value(double.tryParse(r[1].text) ?? 0),
                        ),
                      );
                }
                setState(() => _otherSavingsRows.clear());
              },
            ),
            _buildSection(
              title: "➕ Membership Fees",
              headers: ["DATE", "AMOUNT"],
              rows: _membershipFeesRows,
              onAdd: () => _addRow(_membershipFeesRows, 2),
              onClear: () => _removeRow(_membershipFeesRows),
              onSave: () async {
                for (final r in _membershipFeesRows) {
                  await database
                      .into(database.membershipFees)
                      .insert(
                        MembershipFeesCompanion(
                          clientId: drift.Value(widget.clientId),
                          date: drift.Value(DateTime.parse(r[0].text)),
                          amount: drift.Value(double.tryParse(r[1].text) ?? 0),
                        ),
                      );
                }
                setState(() => _membershipFeesRows.clear());
              },
            ),
          ],
        ),
      ),
    );
  }
}
