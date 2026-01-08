import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/session_manager.dart';
import 'home_screen.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final _passwordController = TextEditingController();
  final _auth = AuthService();
  final _session = SessionManager();
  bool _error = false;

  void _unlock() async {
    if (_session.activeUser == null) return;
    final ok = await _auth.login(
      _session.activeUser!,
      _passwordController.text,
    );

    if (ok) {
      _session.updateActivity();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() => _error = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🔒 Session Locked', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _error ? 'Incorrect password' : null,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: _unlock, child: const Text('Unlock')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
