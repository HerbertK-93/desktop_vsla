import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  String? activeUser;
  DateTime? lastActivity;
  Timer? _timer;
  final Duration timeout = const Duration(minutes: 5);
  Function()? onSessionExpired;

  void startSession(String username, {Function()? onExpire}) {
    activeUser = username;
    lastActivity = DateTime.now();
    onSessionExpired = onExpire;
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => _checkTimeout(),
    );
  }

  void updateActivity() => lastActivity = DateTime.now();

  void _checkTimeout() {
    if (lastActivity != null &&
        DateTime.now().difference(lastActivity!) > timeout) {
      logout();
      onSessionExpired?.call();
    }
  }

  Future<void> logout() async {
    activeUser = null;
    _timer?.cancel();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('activeUser');
  }

  Future<void> persistUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('activeUser', username);
  }

  Future<String?> getPersistedUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('activeUser');
  }
}
