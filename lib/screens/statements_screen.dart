import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:data_table_2/data_table_2.dart';
import '../database/database.dart';

class StatementsScreen extends StatefulWidget {
  const StatementsScreen({super.key});

  @override
  State<StatementsScreen> createState() => _StatementsScreenState();
}

class _StatementsScreenState extends State<StatementsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final AppDatabase _db = AppDatabase();

  Map<String, dynamic>? selectedClient;
  List<dynamic> clients = [];
  List<Map<String, dynamic>> statementEntries = [];

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  Future<void> _loadClients() async {
    final allClients = await _db.select(_db.clients).get();
    setState(() => clients = allClients);
  }

  Future<void> _loadStatement(int clientId) async {
    final data = await _db.getAccountStatement(clientId);
    setState(() => statementEntries = data);
  }

  Future<void> _exportPDF() async {
    if (selectedClient == null || statementEntries.isEmpty) return;

    final pdf = pw.Document();

    // VSLA organization info
    const orgName = "Kigali Community VSLA";
    const orgAddress = "P.O. Box 123, Kigali, Rwanda";
    const orgPhone = "+250 788 000 000";
    const orgEmail = "info@kigalivsla.org";

    final logo = await imageFromAssetBundle(
      'assets/images/logo.png',
    ).catchError((_) => null);

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              if (logo != null)
                pw.Container(width: 70, height: 70, child: pw.Image(logo)),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    orgName,
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blueGrey900,
                    ),
                  ),
                  pw.Text(orgAddress, style: const pw.TextStyle(fontSize: 10)),
                  pw.Text(
                    "Tel: $orgPhone",
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                  pw.Text(
                    "Email: $orgEmail",
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ],
              ),
              pw.SizedBox(width: 70),
            ],
          ),
          pw.Divider(thickness: 1.5),
          pw.SizedBox(height: 15),
          pw.Center(
            child: pw.Text(
              "Account Statement",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                decoration: pw.TextDecoration.underline,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "Client Name: ${selectedClient!['name']}",
            style: const pw.TextStyle(fontSize: 12),
          ),
          pw.Text(
            "Client ID: ${selectedClient!['id']}",
            style: const pw.TextStyle(fontSize: 12),
          ),
          pw.Text(
            "Date Generated: ${DateTime.now().toString().split('.')[0]}",
            style: const pw.TextStyle(fontSize: 12),
          ),
          pw.SizedBox(height: 20),

          pw.Table.fromTextArray(
            headers: [
              "Date",
              "Type",
              "Description",
              "Amount (UGX)",
              "Balance (UGX)",
            ],
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blueGrey700,
            ),
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
            cellHeight: 22,
            oddRowDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
            cellStyle: const pw.TextStyle(fontSize: 10),
            cellAlignment: pw.Alignment.centerLeft,
            data: statementEntries.map((tx) {
              return [
                tx['date'].toString().split(' ')[0],
                tx['type'],
                tx['description'],
                tx['amount'].toStringAsFixed(2),
                tx['balance'].toStringAsFixed(2),
              ];
            }).toList(),
          ),

          pw.SizedBox(height: 30),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey),
                  borderRadius: pw.BorderRadius.circular(6),
                ),
                child: pw.Text(
                  "Closing Balance: ${statementEntries.last['balance'].toStringAsFixed(2)} UGX",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blueGrey800,
                  ),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 30),
          pw.Divider(),
          pw.Center(
            child: pw.Text(
              "Generated by Kigali Community VSLA System",
              style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
            ),
          ),
        ],
      ),
    );

    final pdfBytes = await pdf.save();
    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: '${selectedClient!['name']}_statement.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Financial Statements",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade50,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search client...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: clients.length,
                        itemBuilder: (context, index) {
                          final client = clients[index];
                          if (!client.name.toLowerCase().contains(
                            _searchController.text.toLowerCase(),
                          )) {
                            return const SizedBox.shrink();
                          }
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            elevation: selectedClient?['id'] == client.id
                                ? 4
                                : 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                client.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text("Client ID: ${client.clientId}"),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () {
                                setState(() {
                                  selectedClient = {
                                    'id': client.id,
                                    'name': client.name,
                                  };
                                  statementEntries = [];
                                });
                                _loadStatement(client.id);
                              },
                              selected: selectedClient?['id'] == client.id,
                              selectedTileColor: Colors.blue.shade50,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.white,
                child: selectedClient == null
                    ? const Center(
                        child: Text(
                          "Select a client to view their financial statement",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${selectedClient!['name']}'s Statement",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: _exportPDF,
                                icon: const Icon(Icons.picture_as_pdf_outlined),
                                label: const Text("Download / Print"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey[700],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: statementEntries.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: DataTable2(
                                        columnSpacing: 16,
                                        headingRowColor:
                                            MaterialStateProperty.all(
                                              Colors.blueGrey.shade50,
                                            ),
                                        headingTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                        dataRowHeight: 48,
                                        border: TableBorder.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        columns: const [
                                          DataColumn(label: Text("Date")),
                                          DataColumn(label: Text("Type")),
                                          DataColumn(
                                            label: Text("Description"),
                                          ),
                                          DataColumn(
                                            label: Text("Amount (UGX)"),
                                          ),
                                          DataColumn(
                                            label: Text("Balance (UGX)"),
                                          ),
                                        ],
                                        rows: statementEntries.map((tx) {
                                          return DataRow(
                                            cells: [
                                              DataCell(
                                                Text(
                                                  tx['date'].toString().split(
                                                    ' ',
                                                  )[0],
                                                ),
                                              ),
                                              DataCell(Text(tx['type'])),
                                              DataCell(Text(tx['description'])),
                                              DataCell(
                                                Text(
                                                  tx['amount'].toStringAsFixed(
                                                    2,
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  tx['balance'].toStringAsFixed(
                                                    2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade50,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                              child: Text(
                                "Closing Balance: ${statementEntries.isNotEmpty ? statementEntries.last['balance'].toStringAsFixed(2) : '0.00'} UGX",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
