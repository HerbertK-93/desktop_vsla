import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import '../database/database.dart';

class AuthService {
  /// Single shared database instance (IMPORTANT for desktop)
  static final AppDatabase _db = AppDatabase();

  /// Register a new user
  Future<bool> registerUser(String username, String password) async {
    try {
      final users = await (_db.select(
        _db.users,
      )..where((tbl) => tbl.username.equals(username))).get();

      if (users.isNotEmpty) {
        return false; // Username already exists
      }

      final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

      await _db
          .into(_db.users)
          .insert(
            UsersCompanion(
              username: Value(username),
              passwordHash: Value(hashedPassword),
            ),
          );

      return true;
    } catch (e, stack) {
      print("REGISTER ERROR: $e");
      print(stack.toString());
      return false;
    }
  }

  /// Validate user login
  Future<bool> login(String username, String password) async {
    try {
      final users = await (_db.select(
        _db.users,
      )..where((tbl) => tbl.username.equals(username))).get();

      if (users.isEmpty) return false;

      final user = users.first;
      return BCrypt.checkpw(password, user.passwordHash);
    } catch (e, stack) {
      print("LOGIN ERROR: $e");
      print(stack.toString());
      return false;
    }
  }
}
