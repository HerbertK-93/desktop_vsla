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
  /// 🔐 SINGLETON INSTANCE
  static final AppDatabase _instance = AppDatabase._internal();

  /// Public factory always returns the same instance
  factory AppDatabase() => _instance;

  /// Private constructor (only called once)
  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from == 3) {
        await m.addColumn(clients, clients.gender);
        await m.addColumn(clients, clients.dateOfBirth);
        await m.addColumn(clients, clients.age);
        await m.addColumn(clients, clients.nextOfKinName);
        await m.addColumn(clients, clients.nextOfKinRelationship);
        await m.addColumn(clients, clients.nextOfKinNIN);
      }

      if (from <= 4) {
        await m.addColumn(loans, loans.repaymentDate);
        await m.addColumn(loans, loans.interestType as GeneratedColumn<Object>);
        await m.addColumn(loans, loans.guarantor1Name);
        await m.addColumn(loans, loans.guarantor1NIN);
        await m.addColumn(loans, loans.guarantor2Name);
        await m.addColumn(loans, loans.guarantor2NIN);
        await m.addColumn(loans, loans.guarantor3Name);
        await m.addColumn(loans, loans.guarantor3NIN);
      }
    },
  );

  /// 🔹 Unified account statement (UNCHANGED)
  Future<List<Map<String, dynamic>>> getAccountStatement(int clientId) async {
    final db = attachedDatabase.executor;

    final loans = await db.runSelect(
      "SELECT issued_date AS date, 'Loan' AS type, amount AS amount, 'Loan disbursement' AS description FROM loans WHERE client_id = ?",
      [clientId],
    );

    final loanPayments = await db.runSelect(
      "SELECT payment_date AS date, 'Loan Payment' AS type, amount AS amount, 'Loan repayment' AS description FROM loan_payments WHERE client_id = ?",
      [clientId],
    );

    final savings = await db.runSelect(
      "SELECT saving_date AS date, 'Savings' AS type, amount AS amount, 'Savings deposit' AS description FROM savings WHERE client_id = ?",
      [clientId],
    );

    final welfare = await db.runSelect(
      "SELECT date AS date, 'Welfare' AS type, amount AS amount, 'Welfare contribution' AS description FROM welfares WHERE client_id = ?",
      [clientId],
    );

    final penalties = await db.runSelect(
      "SELECT penalty_date AS date, 'Penalty' AS type, amount AS amount, 'Penalty charge' AS description FROM penalties WHERE client_id = ?",
      [clientId],
    );

    final List<Map<String, dynamic>> all = [
      ...loans,
      ...loanPayments,
      ...savings,
      ...welfare,
      ...penalties,
    ];

    all.sort(
      (a, b) => DateTime.parse(
        a['date'].toString(),
      ).compareTo(DateTime.parse(b['date'].toString())),
    );

    double balance = 0;
    for (final tx in all) {
      final double amount = double.tryParse(tx['amount'].toString()) ?? 0.0;

      if (tx['type'] == 'Loan' ||
          tx['type'] == 'Penalty' ||
          tx['type'] == 'Welfare') {
        balance -= amount;
      } else {
        balance += amount;
      }
      tx['balance'] = balance;
    }

    return all;
  }
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
