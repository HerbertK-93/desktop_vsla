import 'dart:io';
import 'package:flutter/material.dart';
import '../database/database.dart';
import '../../main.dart';

class UserDetailsScreen extends StatefulWidget {
  final Client client;
  const UserDetailsScreen({required this.client});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final List<List<TextEditingController>> _loansRows = [];
  final List<List<TextEditingController>> _loanPaymentsRows = [];
  final List<List<TextEditingController>> _savingsRows = [];
  final List<List<TextEditingController>> _penaltyRows = [];
  final List<List<TextEditingController>> _welfareRows = [];

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
          .map((text) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildEditableRow(List<TextEditingController> controllers) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: controllers
          .map((ctrl) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: ctrl,
                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder()),
                ),
              ))
          .toList(),
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
            child: ElevatedButton(
              onPressed: onSave,
              child: const Text("Save"),
            ),
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
                _buildInfoRow("Name", widget.client.name),
                const Divider(),
                _buildInfoRow("Client ID", widget.client.clientId),
                const Divider(),
                _buildInfoRow("ID Number", widget.client.idNumber),
                const Divider(),
                _buildInfoRow("Contact", widget.client.contact),
                const Divider(),
                _buildInfoRow("Address", widget.client.address),
                const Divider(),
                _buildInfoRow("Date Created",
                    widget.client.date.toLocal().toString().split(' ')[0]),
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
          child: File(widget.client.idImagePath).existsSync()
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(File(widget.client.idImagePath),
                      fit: BoxFit.cover),
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
        title: const Text("Client Information",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            _buildClientInformation(),
            const SizedBox(height: 24),
            Text("Manage Account",
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            _buildStyledTable(
              title: "➕ Loans",
              headers: ["DATE", "LOAN NO", "AMOUNT"],
              rows: _loansRows,
              onAdd: () => _addRow(_loansRows, 3),
              onClear: () => _removeRow(_loansRows),
              onSave: () => print("Saving Loans..."),
              onPrint: () => print("Printing Loans Ledger..."),
            ),
            _buildStyledTable(
              title: "➕ Loan Payments",
              headers: [
                "PAYMENT NO",
                "DUE DATE",
                "AMOUNT",
                "INTEREST(10%)",
                "REMAINING BALANCE"
              ],
              rows: _loanPaymentsRows,
              onAdd: () => _addRow(_loanPaymentsRows, 5),
              onClear: () => _removeRow(_loanPaymentsRows),
              onSave: () => print("Saving Loan Payments..."),
              onPrint: () => print("Printing Loan Payments..."),
            ),
            _buildStyledTable(
              title: "➕ Savings",
              headers: ["DATE", "SAVING NO", "AMOUNT"],
              rows: _savingsRows,
              onAdd: () => _addRow(_savingsRows, 3),
              onClear: () => _removeRow(_savingsRows),
              onSave: () => print("Saving Savings..."),
              onPrint: () => print("Printing Savings Ledger..."),
            ),
            _buildStyledTable(
              title: "➕ Welfare",
              headers: ["DATE", "WELFARE NO", "AMOUNT"],
              rows: _welfareRows,
              onAdd: () => _addRow(_welfareRows, 3),
              onClear: () => _removeRow(_welfareRows),
              onSave: () => print("Saving Welfare..."),
              onPrint: () => print("Printing Welfare Ledger..."),
            ),
            _buildStyledTable(
              title: "➕ Penalties",
              headers: ["DATE", "PENALTY NO", "AMOUNT"],
              rows: _penaltyRows,
              onAdd: () => _addRow(_penaltyRows, 3),
              onClear: () => _removeRow(_penaltyRows),
              onSave: () => print("Saving Penalties..."),
              onPrint: () => print("Printing Penalties Ledger..."),
            ),
          ],
        ),
      ),
    );
  }
}
