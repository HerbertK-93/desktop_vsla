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
  int get schemaVersion => 3; // ⬆️ bumped to v3 for penalty migration

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
      if (from == 1) {
        print("🚀 Upgrading from v1 → v2: Dropping 'welfares' table...");
        await m.deleteTable('welfares');
        await m.createTable(welfares);

        print("🚀 Also dropping 'penalties' table (from v1)...");
        await m.deleteTable('penalties');
        await m.createTable(penalties);
      } else if (from == 2) {
        print("🚀 Upgrading from v2 → v3: Dropping 'penalties' table...");
        await m.deleteTable('penalties');
        await m.createTable(penalties);
        print("✅ 'penalties' table recreated without 'reason'");
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final homeDir = Platform.isWindows
        ? Platform.environment['USERPROFILE']
        : Platform.environment['HOME'];

    final desktopDir = Directory(p.join(homeDir!, 'Desktop'));
    final dbPath = p.join(desktopDir.path, 'app.db');
    final file = File(dbPath);

    print("🖥️ Drift DB saved to Desktop at: $dbPath");

    return NativeDatabase(file);
  });
}
