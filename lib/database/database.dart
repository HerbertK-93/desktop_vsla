import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Clients,
    Loans,
    LoanPayments,
    Savings,
    Penalties,
    Welfares,
    Subscriptions,
    InterestIncome,
    Investments,
    Costs,
  ],
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
    // Detect user's home directory
    final homeDir = Platform.isWindows
        ? Platform.environment['USERPROFILE']
        : Platform.environment['HOME'];

    // Set path to Desktop
    final desktopDir = Directory(p.join(homeDir!, 'Desktop'));
    final dbPath = p.join(desktopDir.path, 'app.db');
    final file = File(dbPath);

    print("🖥️ Drift DB saved to Desktop at: $dbPath");

    return NativeDatabase(file);
  });
}
