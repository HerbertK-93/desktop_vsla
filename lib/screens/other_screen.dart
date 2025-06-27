import 'package:flutter/material.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({super.key});

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  final List<List<TextEditingController>> _subscriptionRows = [];
  final List<List<TextEditingController>> _interestIncomeRows = [];
  final List<List<TextEditingController>> _investmentRows = [];

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

  TableRow _buildEditableRow(List<TextEditingController> controllers) {
    return TableRow(
      children: controllers
          .map(
            (ctrl) => Padding(
              padding: const EdgeInsets.all(4),
              child: TextField(
                controller: ctrl,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> headers,
    required List<List<TextEditingController>> rows,
    required VoidCallback onAdd,
    required VoidCallback onClear,
    required VoidCallback onSave,
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
              headers: ["DATE", "SUBSCRIPTION NO", "AMOUNT"],
              rows: _subscriptionRows,
              onAdd: () => _addRow(_subscriptionRows, 3),
              onClear: () => _removeRow(_subscriptionRows),
              onSave: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Subscription saved")),
                );
              },
            ),
            _buildSection(
              title: "➕ Interest Income",
              headers: ["DATE", "DESCRIPTION", "AMOUNT"],
              rows: _interestIncomeRows,
              onAdd: () => _addRow(_interestIncomeRows, 3),
              onClear: () => _removeRow(_interestIncomeRows),
              onSave: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Interest Income saved")),
                );
              },
            ),
            _buildSection(
              title: "➕ Investments",
              headers: ["DATE", "INVESTMENT NO", "AMOUNT"],
              rows: _investmentRows,
              onAdd: () => _addRow(_investmentRows, 3),
              onClear: () => _removeRow(_investmentRows),
              onSave: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Investments saved")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
