import 'package:drift/drift.dart';

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get clientId => text().unique()();
  TextColumn get name => text()();
  TextColumn get idNumber => text()();
  TextColumn get contact => text()();
  TextColumn get address => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get idImagePath => text()();
}

class Loans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get issuedDate => dateTime()();
  RealColumn get interest => real()();
  RealColumn get totalToPay => real()();
}

class LoanPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  DateTimeColumn get paymentDate => dateTime()();
  TextColumn get paymentNo => text()();
  RealColumn get totalToPay => real()();
  RealColumn get amount => real()();
  RealColumn get remainingBalance => real()();
}

class Savings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get savingNo => text()();
  RealColumn get amount => real()();
  DateTimeColumn get savingDate => dateTime()();
}

class Penalties extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get penaltyNo => text()();
  RealColumn get amount => real()();
  DateTimeColumn get penaltyDate => dateTime()();
  TextColumn get reason => text()();
}

class Welfares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get welfareNo => text()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
}

// ✅ New Independent Tables
class Subscriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class InterestIncome extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class Investments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class Costs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
  TextColumn get purpose => text()();
  RealColumn get amount => real()();
}
