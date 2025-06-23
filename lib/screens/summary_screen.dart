import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Summary content will appear here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
