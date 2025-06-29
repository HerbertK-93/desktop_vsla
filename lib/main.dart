import 'package:flutter/material.dart';
import 'database/database.dart';
import 'screens/home_screen.dart';

late final AppDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = AppDatabase();

  // ✅ Force Drift to open the database and trigger LazyDatabase
  final result = await database.customSelect('SELECT 1').getSingle();
  print("✅ Drift initialized: ${result.data}");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Client Manager',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
