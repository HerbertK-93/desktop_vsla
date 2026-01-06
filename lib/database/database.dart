import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
    OtherSavings,
    MembershipFees,
  ],
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 10;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 9) {
        await m.addColumn(subscriptions, subscriptions.clientId);
        await m.addColumn(investments, investments.clientId);
        await m.addColumn(costs, costs.clientId);
        await m.addColumn(otherSavings, otherSavings.clientId);
        await m.addColumn(membershipFees, membershipFees.clientId);
      }
    },
  );

  /// ✅ Unified account statement
  Future<List<Map<String, dynamic>>> getAccountStatement(int clientId) async {
    final db = attachedDatabase.executor;

    final loans = await db.runSelect(
      '''
      SELECT issued_date AS date, 'Loan' AS type, total_to_pay AS amount, 'Loan (Total to Pay)' AS description
      FROM loans WHERE client_id = ?
      ''',
      [clientId],
    );

    final loanPayments = await db.runSelect(
      '''
      SELECT payment_date AS date, 'Loan Payment' AS type, amount AS amount, 'Loan repayment' AS description
      FROM loan_payments WHERE client_id = ?
      ''',
      [clientId],
    );

    final savings = await db.runSelect(
      '''
      SELECT saving_date AS date, 'Savings' AS type, amount AS amount, 'Savings deposit' AS description
      FROM savings WHERE client_id = ?
      ''',
      [clientId],
    );

    final welfare = await db.runSelect(
      '''
      SELECT date AS date, 'Welfare' AS type, amount AS amount, 'Welfare contribution' AS description
      FROM welfares WHERE client_id = ?
      ''',
      [clientId],
    );

    final penalties = await db.runSelect(
      '''
      SELECT penalty_date AS date, 'Penalty' AS type, amount AS amount, 'Penalty charge' AS description
      FROM penalties WHERE client_id = ?
      ''',
      [clientId],
    );

    final all = [
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

    double balance = 0.0;
    for (final tx in all) {
      final amount = double.tryParse(tx['amount'].toString()) ?? 0.0;
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
    // Get the user's home directory
    final homeDir =
        Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']!;

    // Construct the Desktop path in a platform-independent way
    final desktopPath = p.join(homeDir, 'Desktop');

    // Ensure the Desktop directory exists (it always should, but just in case)
    final desktopDir = Directory(desktopPath);
    if (!await desktopDir.exists()) {
      await desktopDir.create(recursive: true);
    }

    // Define the full path to your Drift database file
    final file = File(p.join(desktopPath, 'app.db'));

    // Print it for debugging so you know exactly where it’s stored
    print('🗃️ Database location: ${file.path}');

    // Use Drift’s background creation for performance
    return NativeDatabase.createInBackground(file);
  });
}
