// lib/main.dart
import 'package:flutter/material.dart';
import 'database/database.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

late final AppDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Client Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AppBootstrapper(),
    );
  }
}

class AppBootstrapper extends StatefulWidget {
  const AppBootstrapper({super.key});

  @override
  State<AppBootstrapper> createState() => _AppBootstrapperState();
}

class _AppBootstrapperState extends State<AppBootstrapper> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      database = AppDatabase();

      // ✅ simple sanity check
      await database.customSelect('SELECT 1').getSingle();

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    } catch (e, st) {
      debugPrint('❌ Init failed: $e');
      debugPrint(st.toString()); // ✅ SAFE

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const InitErrorScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Initialization failed.\nCheck logs.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.redAccent, fontSize: 18),
        ),
      ),
    );
  }
}
