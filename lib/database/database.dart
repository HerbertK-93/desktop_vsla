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

  // Incremented because we added new columns to Loans
  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
    onUpgrade: (m, from, to) async {
      // 🔹 Migration from version 3 to 4 (Client fields)
      if (from == 3) {
        await m.addColumn(clients, clients.gender);
        await m.addColumn(clients, clients.dateOfBirth);
        await m.addColumn(clients, clients.age);
        await m.addColumn(clients, clients.nextOfKinName);
        await m.addColumn(clients, clients.nextOfKinRelationship);
        await m.addColumn(clients, clients.nextOfKinNIN);
      }

      // 🔹 Migration for Loan table new fields
      if (from <= 4) {
        await m.addColumn(loans, loans.repaymentDate);
        await m.addColumn(loans, loans.interestType);
        await m.addColumn(loans, loans.guarantor1Name);
        await m.addColumn(loans, loans.guarantor1NIN);
        await m.addColumn(loans, loans.guarantor2Name);
        await m.addColumn(loans, loans.guarantor2NIN);
        await m.addColumn(loans, loans.guarantor3Name);
        await m.addColumn(loans, loans.guarantor3NIN);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final home = Platform.isWindows
        ? Platform.environment['USERPROFILE']
        : Platform.environment['HOME'];
    final file = File(p.join(home!, 'Desktop', 'app.db'));
    return NativeDatabase(file);
  });
}
