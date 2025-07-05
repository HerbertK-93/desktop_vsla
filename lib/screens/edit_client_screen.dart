import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drift/drift.dart' as drift;
import '../database/database.dart';
import '../../main.dart';

class EditClientScreen extends StatefulWidget {
  final Client client;
  const EditClientScreen({super.key, required this.client});

  @override
  State<EditClientScreen> createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  late final TextEditingController _name;
  late final TextEditingController _clientId;
  late final TextEditingController _idNumber;
  late final TextEditingController _contact;
  late final TextEditingController _address;
  late DateTime _selectedDate;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.client.name);
    _clientId = TextEditingController(text: widget.client.clientId);
    _idNumber = TextEditingController(text: widget.client.idNumber);
    _contact = TextEditingController(text: widget.client.contact);
    _address = TextEditingController(text: widget.client.address);
    _selectedDate = widget.client.date;
    _selectedImage = File(widget.client.idImagePath);
  }

  @override
  void dispose() {
    _name.dispose();
    _clientId.dispose();
    _idNumber.dispose();
    _contact.dispose();
    _address.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  Future<void> _pickDate() async {
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
  }

  Future<void> _save() async {
    final updated = ClientsCompanion(
      id: drift.Value(widget.client.id),
      name: drift.Value(_name.text.trim()),
      clientId: drift.Value(_clientId.text.trim()),
      idNumber: drift.Value(_idNumber.text.trim()),
      contact: drift.Value(_contact.text.trim()),
      address: drift.Value(_address.text.trim()),
      date: drift.Value(_selectedDate),
      idImagePath: drift.Value(_selectedImage!.path),
    );

    final success = await database.update(database.clients).replace(updated);

    if (success) {
      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Client updated")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Update failed")));
    }
  }

  Widget _buildField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
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
      appBar: AppBar(title: const Text("Edit Client")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildField("Client ID", _clientId),
          _buildField("Full Name", _name),
          _buildField("ID Number", _idNumber),
          _buildField("Contact", _contact),
          _buildField("Address", _address),
          const SizedBox(height: 16),

          // Date Picker
          InputDecorator(
            decoration: _inputDecoration("Creation Date"),
            child: InkWell(
              onTap: _pickDate,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Image Picker
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
                  "Edit Client ID Image",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Change Image"),
                    ),
                    const SizedBox(width: 20),
                    if (_selectedImage != null)
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueGrey, width: 1),
                          image: DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.save),
            label: const Text("Save Changes"),
          ),
        ],
      ),
    );
  }
}
