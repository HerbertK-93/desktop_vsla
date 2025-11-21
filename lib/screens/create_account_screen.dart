import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drift/drift.dart' as drift;
import '../database/database.dart';
import '../../main.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _nameController = TextEditingController();
  final _clientIdController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();

  // New Fields
  String? _gender;
  DateTime? _dob;
  int _age = 0;

  final _nokNameController = TextEditingController();
  final _nokRelationshipController = TextEditingController();
  final _nokNinController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  File? _idImageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _idImageFile = File(picked.path);
      });
    }
  }

  void _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    setState(() {
      _age = age;
    });
  }

  Future<void> _saveClient() async {
    try {
      if (_nameController.text.isEmpty ||
          _clientIdController.text.isEmpty ||
          _idNumberController.text.isEmpty ||
          _contactController.text.isEmpty ||
          _addressController.text.isEmpty ||
          _idImageFile == null ||
          _gender == null ||
          _dob == null ||
          _age == 0 ||
          _nokNameController.text.isEmpty ||
          _nokRelationshipController.text.isEmpty ||
          _nokNinController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill all fields and upload an image"),
          ),
        );
        return;
      }

      final client = ClientsCompanion(
        clientId: drift.Value(_clientIdController.text),
        name: drift.Value(_nameController.text),
        idNumber: drift.Value(_idNumberController.text),
        contact: drift.Value(_contactController.text),
        address: drift.Value(_addressController.text),
        date: drift.Value(_selectedDate),
        idImagePath: drift.Value(_idImageFile!.path),

        // New
        gender: drift.Value(_gender!),
        dateOfBirth: drift.Value(_dob!),
        age: drift.Value(_age),
        nextOfKinName: drift.Value(_nokNameController.text),
        nextOfKinRelationship: drift.Value(_nokRelationshipController.text),
        nextOfKinNIN: drift.Value(_nokNinController.text),
      );

      final id = await database.into(database.clients).insert(client);
      debugPrint('✅ Client saved with ID: $id');

      final insertedClient = await (database.select(
        database.clients,
      )..where((tbl) => tbl.id.equals(id))).getSingle();
      debugPrint('📌 Verified client: ${insertedClient.name}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Client saved successfully')),
      );

      Navigator.pop(context);
    } catch (e, stackTrace) {
      debugPrint('❌ ERROR saving client: $e');
      debugPrint('Stack trace: $stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving client: ${e.toString()}')),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Client Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: _nameController,
            decoration: _inputDecoration("Client Name"),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _clientIdController,
            decoration: _inputDecoration("Client ID"),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _idNumberController,
            decoration: _inputDecoration("Client ID Number"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _contactController,
            decoration: _inputDecoration("Client Contact"),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _addressController,
            decoration: _inputDecoration("Client Address"),
          ),
          const SizedBox(height: 20),

          // Gender Dropdown
          InputDecorator(
            decoration: _inputDecoration("Gender"),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _gender,
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                hint: const Text("Select gender"),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Date of Birth
          InputDecorator(
            decoration: _inputDecoration("Date of Birth"),
            child: InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(DateTime.now().year - 18),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  _calculateAge(picked);
                  setState(() => _dob = picked);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  _dob == null
                      ? "Select Date of Birth"
                      : "${_dob!.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Age
          TextField(
            decoration: _inputDecoration("Age"),
            readOnly: true,
            controller: TextEditingController(
              text: _age == 0 ? "" : _age.toString(),
            ),
          ),
          const SizedBox(height: 20),

          // Main Date (Existing Date Field)
          InputDecorator(
            decoration: _inputDecoration("Date"),
            child: InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ID Image Upload
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Attach Client ID Image",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Upload ID Image"),
                    ),
                    const SizedBox(width: 20),
                    if (_idImageFile != null)
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueGrey, width: 1),
                          image: DecorationImage(
                            image: FileImage(_idImageFile!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // NEXT OF KIN SECTION
          const Text(
            "Next of Kin Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _nokNameController,
            decoration: _inputDecoration("Next of Kin Name"),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _nokRelationshipController,
            decoration: _inputDecoration("Relationship"),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _nokNinController,
            decoration: _inputDecoration("NIN"),
          ),

          const SizedBox(height: 40),

          Center(
            child: OutlinedButton(
              onPressed: _saveClient,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 18,
                ),
                side: const BorderSide(color: Colors.blue),
              ),
              child: const Text("Save Account"),
            ),
          ),
        ],
      ),
    );
  }
}
