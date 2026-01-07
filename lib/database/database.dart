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

  /// ✅ FULL & CORRECT ACCOUNT STATEMENT
  Future<List<Map<String, dynamic>>> getAccountStatement(int clientId) async {
    final db = attachedDatabase.executor;
    final rows = <Map<String, dynamic>>[];

    Future<void> add(String sql) async {
      final result = await db.runSelect(sql, [clientId]);
      rows.addAll(result.cast<Map<String, dynamic>>());
    }

    await add('''
      SELECT issued_date AS date, 'Loan' AS type,
             total_to_pay AS amount, 'Loan (Total to Pay)' AS description
      FROM loans WHERE client_id = ?
    ''');

    await add('''
      SELECT payment_date AS date, 'Loan Payment' AS type,
             amount AS amount, 'Loan repayment' AS description
      FROM loan_payments WHERE client_id = ?
    ''');

    await add('''
      SELECT saving_date AS date, 'Savings' AS type,
             amount AS amount, 'Savings deposit' AS description
      FROM savings WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Welfare' AS type,
             amount AS amount, 'Welfare contribution' AS description
      FROM welfares WHERE client_id = ?
    ''');

    await add('''
      SELECT penalty_date AS date, 'Penalty' AS type,
             amount AS amount, 'Penalty charge' AS description
      FROM penalties WHERE client_id = ?
    ''');

    // 🔹 OTHERS SCREEN DATA
    await add('''
      SELECT date AS date, 'Subscription' AS type,
             amount AS amount, 'Subscription' AS description
      FROM subscriptions WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Interest Income' AS type,
             amount AS amount, 'Interest income' AS description
      FROM interest_income WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Investment' AS type,
             amount AS amount, 'Investment' AS description
      FROM investments WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Cost' AS type,
             amount AS amount, 'Cost component' AS description
      FROM costs WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Other Savings' AS type,
             amount AS amount, 'Other savings' AS description
      FROM other_savings WHERE client_id = ?
    ''');

    await add('''
      SELECT date AS date, 'Membership Fee' AS type,
             amount AS amount, 'Membership fee' AS description
      FROM membership_fees WHERE client_id = ?
    ''');

    // 📅 Sort chronologically
    rows.sort(
      (a, b) => DateTime.parse(
        a['date'].toString(),
      ).compareTo(DateTime.parse(b['date'].toString())),
    );

    // 💰 Running balance
    double balance = 0.0;

    for (final tx in rows) {
      final amount = double.tryParse(tx['amount'].toString()) ?? 0.0;

      switch (tx['type']) {
        case 'Loan':
        case 'Penalty':
        case 'Welfare':
        case 'Subscription':
        case 'Cost':
        case 'Membership Fee':
          balance -= amount;
          break;
        default:
          balance += amount;
      }

      tx['balance'] = balance;
    }

    return rows;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final homeDir =
        Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']!;
    final desktopPath = p.join(homeDir, 'Desktop');
    final file = File(p.join(desktopPath, 'app.db'));

    print('🗃️ Database location: ${file.path}');
    return NativeDatabase.createInBackground(file);
  });
}
