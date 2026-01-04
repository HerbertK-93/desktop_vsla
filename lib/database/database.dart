import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart'; // ✅ Add this for safe paths

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
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
    onUpgrade: (m, from, to) async {
      // Optional: handle migrations gracefully
      await m.createAll();
    },
  );

  /// ✅ Unified account statement
  Future<List<Map<String, dynamic>>> getAccountStatement(int clientId) async {
    final db = attachedDatabase.executor;

    // 🔴 LOANS → TOTAL TO PAY
    final loans = await db.runSelect(
      '''
      SELECT issued_date AS date, 'Loan' AS type, total_to_pay AS amount, 'Loan (Total to Pay)' AS description
      FROM loans WHERE client_id = ?
      ''',
      [clientId],
    );

    // 💸 LOAN PAYMENTS
    final loanPayments = await db.runSelect(
      '''
      SELECT payment_date AS date, 'Loan Payment' AS type, amount AS amount, 'Loan repayment' AS description
      FROM loan_payments WHERE client_id = ?
      ''',
      [clientId],
    );

    // 💰 SAVINGS
    final savings = await db.runSelect(
      '''
      SELECT saving_date AS date, 'Savings' AS type, amount AS amount, 'Savings deposit' AS description
      FROM savings WHERE client_id = ?
      ''',
      [clientId],
    );

    // 🫂 WELFARE
    final welfare = await db.runSelect(
      '''
      SELECT date AS date, 'Welfare' AS type, amount AS amount, 'Welfare contribution' AS description
      FROM welfares WHERE client_id = ?
      ''',
      [clientId],
    );

    // ⚠️ PENALTIES
    final penalties = await db.runSelect(
      '''
      SELECT penalty_date AS date, 'Penalty' AS type, amount AS amount, 'Penalty charge' AS description
      FROM penalties WHERE client_id = ?
      ''',
      [clientId],
    );

    // 🔗 Combine all
    final List<Map<String, dynamic>> all = [
      ...loans,
      ...loanPayments,
      ...savings,
      ...welfare,
      ...penalties,
    ];

    // 📅 Sort by date
    all.sort(
      (a, b) => DateTime.parse(
        a['date'].toString(),
      ).compareTo(DateTime.parse(b['date'].toString())),
    );

    // 📊 Running balance
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

/// ✅ Safe database connection with cross-platform handling
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    try {
      final dir =
          await getApplicationSupportDirectory(); // ✅ guaranteed to exist
      final file = File(p.join(dir.path, 'app.db'));
      print('Database path: ${file.path}');
      return NativeDatabase.createInBackground(file);
    } catch (e, st) {
      print('Error opening database: $e');
      print(st);
      rethrow;
    }
  });
}
