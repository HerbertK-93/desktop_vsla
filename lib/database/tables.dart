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
  TextColumn get gender => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get nextOfKinName => text().nullable()();
  TextColumn get nextOfKinRelationship => text().nullable()();
  TextColumn get nextOfKinNIN => text().nullable()();
}

class Loans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get issuedDate => dateTime()();
  RealColumn get interest => real()();
  RealColumn get totalToPay => real()();
  DateTimeColumn get repaymentDate => dateTime().nullable()();

  /// ✅ MUST EXIST OR INSERTS WILL FAIL
  TextColumn get interestType => text().nullable()();

  TextColumn get guarantor1Name => text().nullable()();
  TextColumn get guarantor1NIN => text().nullable()();
  TextColumn get guarantor2Name => text().nullable()();
  TextColumn get guarantor2NIN => text().nullable()();
  TextColumn get guarantor3Name => text().nullable()();
  TextColumn get guarantor3NIN => text().nullable()();
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
}

class Welfares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get welfareNo => text()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
}

class Subscriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class InterestIncome extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
  TextColumn get description => text().nullable()();
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
