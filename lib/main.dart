import 'package:flutter/material.dart';
import 'database/database.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart'; // Added import

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
      home: SplashLoader(), // Show splash first
    );
  }
}

// Loader that shows SplashScreen and navigates to HomeScreen
class SplashLoader extends StatefulWidget {
  @override
  _SplashLoaderState createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
