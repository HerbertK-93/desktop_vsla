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
  IntColumn get loanId => integer().references(Loans, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get paymentDate => dateTime()();
}

class Savings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get savingDate => dateTime()();
}

class Penalties extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get reason => text()();
  RealColumn get amount => real()();
  DateTimeColumn get penaltyDate => dateTime()();
}

class Welfares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
}
