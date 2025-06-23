import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Clients, Loans, LoanPayments, Savings, Penalties, Welfares],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          print("⛏️ Drift is creating tables...");
          await m.createAll();
        },
        beforeOpen: (OpeningDetails details) async {
          await customStatement('PRAGMA foreign_keys = ON');
          print("✅ Foreign key constraints enabled");
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Future migrations
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));

    // Optional: Force DB reset for debugging
    if (await file.exists()) {
      print("⚠️ Deleting old DB: ${file.path}");
      await file.delete();
    }

    print("📍 Creating SQLite DB at: ${file.path}");
    return NativeDatabase(file);
  });
}
