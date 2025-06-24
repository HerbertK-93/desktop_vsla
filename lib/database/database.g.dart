// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<String> idNumber = GeneratedColumn<String>(
      'id_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _idImagePathMeta =
      const VerificationMeta('idImagePath');
  @override
  late final GeneratedColumn<String> idImagePath = GeneratedColumn<String>(
      'id_image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, name, idNumber, contact, address, date, idImagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id_image_path')) {
      context.handle(
          _idImagePathMeta,
          idImagePath.isAcceptableOrUnknown(
              data['id_image_path']!, _idImagePathMeta));
    } else if (isInserting) {
      context.missing(_idImagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_number'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      idImagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_image_path'])!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final String clientId;
  final String name;
  final String idNumber;
  final String contact;
  final String address;
  final DateTime date;
  final String idImagePath;
  const Client(
      {required this.id,
      required this.clientId,
      required this.name,
      required this.idNumber,
      required this.contact,
      required this.address,
      required this.date,
      required this.idImagePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<String>(clientId);
    map['name'] = Variable<String>(name);
    map['id_number'] = Variable<String>(idNumber);
    map['contact'] = Variable<String>(contact);
    map['address'] = Variable<String>(address);
    map['date'] = Variable<DateTime>(date);
    map['id_image_path'] = Variable<String>(idImagePath);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      name: Value(name),
      idNumber: Value(idNumber),
      contact: Value(contact),
      address: Value(address),
      date: Value(date),
      idImagePath: Value(idImagePath),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      name: serializer.fromJson<String>(json['name']),
      idNumber: serializer.fromJson<String>(json['idNumber']),
      contact: serializer.fromJson<String>(json['contact']),
      address: serializer.fromJson<String>(json['address']),
      date: serializer.fromJson<DateTime>(json['date']),
      idImagePath: serializer.fromJson<String>(json['idImagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<String>(clientId),
      'name': serializer.toJson<String>(name),
      'idNumber': serializer.toJson<String>(idNumber),
      'contact': serializer.toJson<String>(contact),
      'address': serializer.toJson<String>(address),
      'date': serializer.toJson<DateTime>(date),
      'idImagePath': serializer.toJson<String>(idImagePath),
    };
  }

  Client copyWith(
          {int? id,
          String? clientId,
          String? name,
          String? idNumber,
          String? contact,
          String? address,
          DateTime? date,
          String? idImagePath}) =>
      Client(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        name: name ?? this.name,
        idNumber: idNumber ?? this.idNumber,
        contact: contact ?? this.contact,
        address: address ?? this.address,
        date: date ?? this.date,
        idImagePath: idImagePath ?? this.idImagePath,
      );
  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('idNumber: $idNumber, ')
          ..write('contact: $contact, ')
          ..write('address: $address, ')
          ..write('date: $date, ')
          ..write('idImagePath: $idImagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, clientId, name, idNumber, contact, address, date, idImagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.name == this.name &&
          other.idNumber == this.idNumber &&
          other.contact == this.contact &&
          other.address == this.address &&
          other.date == this.date &&
          other.idImagePath == this.idImagePath);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> clientId;
  final Value<String> name;
  final Value<String> idNumber;
  final Value<String> contact;
  final Value<String> address;
  final Value<DateTime> date;
  final Value<String> idImagePath;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.contact = const Value.absent(),
    this.address = const Value.absent(),
    this.date = const Value.absent(),
    this.idImagePath = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String clientId,
    required String name,
    required String idNumber,
    required String contact,
    required String address,
    required DateTime date,
    required String idImagePath,
  })  : clientId = Value(clientId),
        name = Value(name),
        idNumber = Value(idNumber),
        contact = Value(contact),
        address = Value(address),
        date = Value(date),
        idImagePath = Value(idImagePath);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? clientId,
    Expression<String>? name,
    Expression<String>? idNumber,
    Expression<String>? contact,
    Expression<String>? address,
    Expression<DateTime>? date,
    Expression<String>? idImagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (name != null) 'name': name,
      if (idNumber != null) 'id_number': idNumber,
      if (contact != null) 'contact': contact,
      if (address != null) 'address': address,
      if (date != null) 'date': date,
      if (idImagePath != null) 'id_image_path': idImagePath,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? clientId,
      Value<String>? name,
      Value<String>? idNumber,
      Value<String>? contact,
      Value<String>? address,
      Value<DateTime>? date,
      Value<String>? idImagePath}) {
    return ClientsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      idNumber: idNumber ?? this.idNumber,
      contact: contact ?? this.contact,
      address: address ?? this.address,
      date: date ?? this.date,
      idImagePath: idImagePath ?? this.idImagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<String>(idNumber.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (idImagePath.present) {
      map['id_image_path'] = Variable<String>(idImagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('idNumber: $idNumber, ')
          ..write('contact: $contact, ')
          ..write('address: $address, ')
          ..write('date: $date, ')
          ..write('idImagePath: $idImagePath')
          ..write(')'))
        .toString();
  }
}

class $LoansTable extends Loans with TableInfo<$LoansTable, Loan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _issuedDateMeta =
      const VerificationMeta('issuedDate');
  @override
  late final GeneratedColumn<DateTime> issuedDate = GeneratedColumn<DateTime>(
      'issued_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _interestMeta =
      const VerificationMeta('interest');
  @override
  late final GeneratedColumn<double> interest = GeneratedColumn<double>(
      'interest', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalToPayMeta =
      const VerificationMeta('totalToPay');
  @override
  late final GeneratedColumn<double> totalToPay = GeneratedColumn<double>(
      'total_to_pay', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, amount, issuedDate, interest, totalToPay];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loans';
  @override
  VerificationContext validateIntegrity(Insertable<Loan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('issued_date')) {
      context.handle(
          _issuedDateMeta,
          issuedDate.isAcceptableOrUnknown(
              data['issued_date']!, _issuedDateMeta));
    } else if (isInserting) {
      context.missing(_issuedDateMeta);
    }
    if (data.containsKey('interest')) {
      context.handle(_interestMeta,
          interest.isAcceptableOrUnknown(data['interest']!, _interestMeta));
    } else if (isInserting) {
      context.missing(_interestMeta);
    }
    if (data.containsKey('total_to_pay')) {
      context.handle(
          _totalToPayMeta,
          totalToPay.isAcceptableOrUnknown(
              data['total_to_pay']!, _totalToPayMeta));
    } else if (isInserting) {
      context.missing(_totalToPayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Loan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Loan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      issuedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}issued_date'])!,
      interest: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interest'])!,
      totalToPay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_to_pay'])!,
    );
  }

  @override
  $LoansTable createAlias(String alias) {
    return $LoansTable(attachedDatabase, alias);
  }
}

class Loan extends DataClass implements Insertable<Loan> {
  final int id;
  final int clientId;
  final double amount;
  final DateTime issuedDate;
  final double interest;
  final double totalToPay;
  const Loan(
      {required this.id,
      required this.clientId,
      required this.amount,
      required this.issuedDate,
      required this.interest,
      required this.totalToPay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['amount'] = Variable<double>(amount);
    map['issued_date'] = Variable<DateTime>(issuedDate);
    map['interest'] = Variable<double>(interest);
    map['total_to_pay'] = Variable<double>(totalToPay);
    return map;
  }

  LoansCompanion toCompanion(bool nullToAbsent) {
    return LoansCompanion(
      id: Value(id),
      clientId: Value(clientId),
      amount: Value(amount),
      issuedDate: Value(issuedDate),
      interest: Value(interest),
      totalToPay: Value(totalToPay),
    );
  }

  factory Loan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Loan(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      amount: serializer.fromJson<double>(json['amount']),
      issuedDate: serializer.fromJson<DateTime>(json['issuedDate']),
      interest: serializer.fromJson<double>(json['interest']),
      totalToPay: serializer.fromJson<double>(json['totalToPay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'amount': serializer.toJson<double>(amount),
      'issuedDate': serializer.toJson<DateTime>(issuedDate),
      'interest': serializer.toJson<double>(interest),
      'totalToPay': serializer.toJson<double>(totalToPay),
    };
  }

  Loan copyWith(
          {int? id,
          int? clientId,
          double? amount,
          DateTime? issuedDate,
          double? interest,
          double? totalToPay}) =>
      Loan(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        amount: amount ?? this.amount,
        issuedDate: issuedDate ?? this.issuedDate,
        interest: interest ?? this.interest,
        totalToPay: totalToPay ?? this.totalToPay,
      );
  @override
  String toString() {
    return (StringBuffer('Loan(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('amount: $amount, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('interest: $interest, ')
          ..write('totalToPay: $totalToPay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, amount, issuedDate, interest, totalToPay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Loan &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.amount == this.amount &&
          other.issuedDate == this.issuedDate &&
          other.interest == this.interest &&
          other.totalToPay == this.totalToPay);
}

class LoansCompanion extends UpdateCompanion<Loan> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<double> amount;
  final Value<DateTime> issuedDate;
  final Value<double> interest;
  final Value<double> totalToPay;
  const LoansCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.amount = const Value.absent(),
    this.issuedDate = const Value.absent(),
    this.interest = const Value.absent(),
    this.totalToPay = const Value.absent(),
  });
  LoansCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required double amount,
    required DateTime issuedDate,
    required double interest,
    required double totalToPay,
  })  : clientId = Value(clientId),
        amount = Value(amount),
        issuedDate = Value(issuedDate),
        interest = Value(interest),
        totalToPay = Value(totalToPay);
  static Insertable<Loan> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<double>? amount,
    Expression<DateTime>? issuedDate,
    Expression<double>? interest,
    Expression<double>? totalToPay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (amount != null) 'amount': amount,
      if (issuedDate != null) 'issued_date': issuedDate,
      if (interest != null) 'interest': interest,
      if (totalToPay != null) 'total_to_pay': totalToPay,
    });
  }

  LoansCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<double>? amount,
      Value<DateTime>? issuedDate,
      Value<double>? interest,
      Value<double>? totalToPay}) {
    return LoansCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      amount: amount ?? this.amount,
      issuedDate: issuedDate ?? this.issuedDate,
      interest: interest ?? this.interest,
      totalToPay: totalToPay ?? this.totalToPay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (issuedDate.present) {
      map['issued_date'] = Variable<DateTime>(issuedDate.value);
    }
    if (interest.present) {
      map['interest'] = Variable<double>(interest.value);
    }
    if (totalToPay.present) {
      map['total_to_pay'] = Variable<double>(totalToPay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoansCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('amount: $amount, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('interest: $interest, ')
          ..write('totalToPay: $totalToPay')
          ..write(')'))
        .toString();
  }
}

class $LoanPaymentsTable extends LoanPayments
    with TableInfo<$LoanPaymentsTable, LoanPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _paymentNoMeta =
      const VerificationMeta('paymentNo');
  @override
  late final GeneratedColumn<String> paymentNo = GeneratedColumn<String>(
      'payment_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalToPayMeta =
      const VerificationMeta('totalToPay');
  @override
  late final GeneratedColumn<double> totalToPay = GeneratedColumn<double>(
      'total_to_pay', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _remainingBalanceMeta =
      const VerificationMeta('remainingBalance');
  @override
  late final GeneratedColumn<double> remainingBalance = GeneratedColumn<double>(
      'remaining_balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        clientId,
        paymentDate,
        paymentNo,
        totalToPay,
        amount,
        remainingBalance
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_payments';
  @override
  VerificationContext validateIntegrity(Insertable<LoanPayment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('payment_no')) {
      context.handle(_paymentNoMeta,
          paymentNo.isAcceptableOrUnknown(data['payment_no']!, _paymentNoMeta));
    } else if (isInserting) {
      context.missing(_paymentNoMeta);
    }
    if (data.containsKey('total_to_pay')) {
      context.handle(
          _totalToPayMeta,
          totalToPay.isAcceptableOrUnknown(
              data['total_to_pay']!, _totalToPayMeta));
    } else if (isInserting) {
      context.missing(_totalToPayMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('remaining_balance')) {
      context.handle(
          _remainingBalanceMeta,
          remainingBalance.isAcceptableOrUnknown(
              data['remaining_balance']!, _remainingBalanceMeta));
    } else if (isInserting) {
      context.missing(_remainingBalanceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoanPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanPayment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      paymentNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_no'])!,
      totalToPay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_to_pay'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      remainingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}remaining_balance'])!,
    );
  }

  @override
  $LoanPaymentsTable createAlias(String alias) {
    return $LoanPaymentsTable(attachedDatabase, alias);
  }
}

class LoanPayment extends DataClass implements Insertable<LoanPayment> {
  final int id;
  final int clientId;
  final DateTime paymentDate;
  final String paymentNo;
  final double totalToPay;
  final double amount;
  final double remainingBalance;
  const LoanPayment(
      {required this.id,
      required this.clientId,
      required this.paymentDate,
      required this.paymentNo,
      required this.totalToPay,
      required this.amount,
      required this.remainingBalance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['payment_no'] = Variable<String>(paymentNo);
    map['total_to_pay'] = Variable<double>(totalToPay);
    map['amount'] = Variable<double>(amount);
    map['remaining_balance'] = Variable<double>(remainingBalance);
    return map;
  }

  LoanPaymentsCompanion toCompanion(bool nullToAbsent) {
    return LoanPaymentsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      paymentDate: Value(paymentDate),
      paymentNo: Value(paymentNo),
      totalToPay: Value(totalToPay),
      amount: Value(amount),
      remainingBalance: Value(remainingBalance),
    );
  }

  factory LoanPayment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanPayment(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      paymentNo: serializer.fromJson<String>(json['paymentNo']),
      totalToPay: serializer.fromJson<double>(json['totalToPay']),
      amount: serializer.fromJson<double>(json['amount']),
      remainingBalance: serializer.fromJson<double>(json['remainingBalance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'paymentNo': serializer.toJson<String>(paymentNo),
      'totalToPay': serializer.toJson<double>(totalToPay),
      'amount': serializer.toJson<double>(amount),
      'remainingBalance': serializer.toJson<double>(remainingBalance),
    };
  }

  LoanPayment copyWith(
          {int? id,
          int? clientId,
          DateTime? paymentDate,
          String? paymentNo,
          double? totalToPay,
          double? amount,
          double? remainingBalance}) =>
      LoanPayment(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentNo: paymentNo ?? this.paymentNo,
        totalToPay: totalToPay ?? this.totalToPay,
        amount: amount ?? this.amount,
        remainingBalance: remainingBalance ?? this.remainingBalance,
      );
  @override
  String toString() {
    return (StringBuffer('LoanPayment(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentNo: $paymentNo, ')
          ..write('totalToPay: $totalToPay, ')
          ..write('amount: $amount, ')
          ..write('remainingBalance: $remainingBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, paymentDate, paymentNo,
      totalToPay, amount, remainingBalance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanPayment &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.paymentDate == this.paymentDate &&
          other.paymentNo == this.paymentNo &&
          other.totalToPay == this.totalToPay &&
          other.amount == this.amount &&
          other.remainingBalance == this.remainingBalance);
}

class LoanPaymentsCompanion extends UpdateCompanion<LoanPayment> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<DateTime> paymentDate;
  final Value<String> paymentNo;
  final Value<double> totalToPay;
  final Value<double> amount;
  final Value<double> remainingBalance;
  const LoanPaymentsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentNo = const Value.absent(),
    this.totalToPay = const Value.absent(),
    this.amount = const Value.absent(),
    this.remainingBalance = const Value.absent(),
  });
  LoanPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required DateTime paymentDate,
    required String paymentNo,
    required double totalToPay,
    required double amount,
    required double remainingBalance,
  })  : clientId = Value(clientId),
        paymentDate = Value(paymentDate),
        paymentNo = Value(paymentNo),
        totalToPay = Value(totalToPay),
        amount = Value(amount),
        remainingBalance = Value(remainingBalance);
  static Insertable<LoanPayment> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentNo,
    Expression<double>? totalToPay,
    Expression<double>? amount,
    Expression<double>? remainingBalance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentNo != null) 'payment_no': paymentNo,
      if (totalToPay != null) 'total_to_pay': totalToPay,
      if (amount != null) 'amount': amount,
      if (remainingBalance != null) 'remaining_balance': remainingBalance,
    });
  }

  LoanPaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<DateTime>? paymentDate,
      Value<String>? paymentNo,
      Value<double>? totalToPay,
      Value<double>? amount,
      Value<double>? remainingBalance}) {
    return LoanPaymentsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentNo: paymentNo ?? this.paymentNo,
      totalToPay: totalToPay ?? this.totalToPay,
      amount: amount ?? this.amount,
      remainingBalance: remainingBalance ?? this.remainingBalance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentNo.present) {
      map['payment_no'] = Variable<String>(paymentNo.value);
    }
    if (totalToPay.present) {
      map['total_to_pay'] = Variable<double>(totalToPay.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (remainingBalance.present) {
      map['remaining_balance'] = Variable<double>(remainingBalance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentNo: $paymentNo, ')
          ..write('totalToPay: $totalToPay, ')
          ..write('amount: $amount, ')
          ..write('remainingBalance: $remainingBalance')
          ..write(')'))
        .toString();
  }
}

class $SavingsTable extends Savings with TableInfo<$SavingsTable, Saving> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _savingNoMeta =
      const VerificationMeta('savingNo');
  @override
  late final GeneratedColumn<String> savingNo = GeneratedColumn<String>(
      'saving_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _savingDateMeta =
      const VerificationMeta('savingDate');
  @override
  late final GeneratedColumn<DateTime> savingDate = GeneratedColumn<DateTime>(
      'saving_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, savingNo, amount, savingDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings';
  @override
  VerificationContext validateIntegrity(Insertable<Saving> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('saving_no')) {
      context.handle(_savingNoMeta,
          savingNo.isAcceptableOrUnknown(data['saving_no']!, _savingNoMeta));
    } else if (isInserting) {
      context.missing(_savingNoMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('saving_date')) {
      context.handle(
          _savingDateMeta,
          savingDate.isAcceptableOrUnknown(
              data['saving_date']!, _savingDateMeta));
    } else if (isInserting) {
      context.missing(_savingDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Saving map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Saving(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      savingNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}saving_no'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      savingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}saving_date'])!,
    );
  }

  @override
  $SavingsTable createAlias(String alias) {
    return $SavingsTable(attachedDatabase, alias);
  }
}

class Saving extends DataClass implements Insertable<Saving> {
  final int id;
  final int clientId;
  final String savingNo;
  final double amount;
  final DateTime savingDate;
  const Saving(
      {required this.id,
      required this.clientId,
      required this.savingNo,
      required this.amount,
      required this.savingDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['saving_no'] = Variable<String>(savingNo);
    map['amount'] = Variable<double>(amount);
    map['saving_date'] = Variable<DateTime>(savingDate);
    return map;
  }

  SavingsCompanion toCompanion(bool nullToAbsent) {
    return SavingsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      savingNo: Value(savingNo),
      amount: Value(amount),
      savingDate: Value(savingDate),
    );
  }

  factory Saving.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Saving(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      savingNo: serializer.fromJson<String>(json['savingNo']),
      amount: serializer.fromJson<double>(json['amount']),
      savingDate: serializer.fromJson<DateTime>(json['savingDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'savingNo': serializer.toJson<String>(savingNo),
      'amount': serializer.toJson<double>(amount),
      'savingDate': serializer.toJson<DateTime>(savingDate),
    };
  }

  Saving copyWith(
          {int? id,
          int? clientId,
          String? savingNo,
          double? amount,
          DateTime? savingDate}) =>
      Saving(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        savingNo: savingNo ?? this.savingNo,
        amount: amount ?? this.amount,
        savingDate: savingDate ?? this.savingDate,
      );
  @override
  String toString() {
    return (StringBuffer('Saving(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('savingNo: $savingNo, ')
          ..write('amount: $amount, ')
          ..write('savingDate: $savingDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, savingNo, amount, savingDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Saving &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.savingNo == this.savingNo &&
          other.amount == this.amount &&
          other.savingDate == this.savingDate);
}

class SavingsCompanion extends UpdateCompanion<Saving> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> savingNo;
  final Value<double> amount;
  final Value<DateTime> savingDate;
  const SavingsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.savingNo = const Value.absent(),
    this.amount = const Value.absent(),
    this.savingDate = const Value.absent(),
  });
  SavingsCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String savingNo,
    required double amount,
    required DateTime savingDate,
  })  : clientId = Value(clientId),
        savingNo = Value(savingNo),
        amount = Value(amount),
        savingDate = Value(savingDate);
  static Insertable<Saving> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? savingNo,
    Expression<double>? amount,
    Expression<DateTime>? savingDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (savingNo != null) 'saving_no': savingNo,
      if (amount != null) 'amount': amount,
      if (savingDate != null) 'saving_date': savingDate,
    });
  }

  SavingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? savingNo,
      Value<double>? amount,
      Value<DateTime>? savingDate}) {
    return SavingsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      savingNo: savingNo ?? this.savingNo,
      amount: amount ?? this.amount,
      savingDate: savingDate ?? this.savingDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (savingNo.present) {
      map['saving_no'] = Variable<String>(savingNo.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (savingDate.present) {
      map['saving_date'] = Variable<DateTime>(savingDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('savingNo: $savingNo, ')
          ..write('amount: $amount, ')
          ..write('savingDate: $savingDate')
          ..write(')'))
        .toString();
  }
}

class $PenaltiesTable extends Penalties
    with TableInfo<$PenaltiesTable, Penalty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PenaltiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _penaltyDateMeta =
      const VerificationMeta('penaltyDate');
  @override
  late final GeneratedColumn<DateTime> penaltyDate = GeneratedColumn<DateTime>(
      'penalty_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, reason, amount, penaltyDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'penalties';
  @override
  VerificationContext validateIntegrity(Insertable<Penalty> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('penalty_date')) {
      context.handle(
          _penaltyDateMeta,
          penaltyDate.isAcceptableOrUnknown(
              data['penalty_date']!, _penaltyDateMeta));
    } else if (isInserting) {
      context.missing(_penaltyDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Penalty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Penalty(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      penaltyDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}penalty_date'])!,
    );
  }

  @override
  $PenaltiesTable createAlias(String alias) {
    return $PenaltiesTable(attachedDatabase, alias);
  }
}

class Penalty extends DataClass implements Insertable<Penalty> {
  final int id;
  final int clientId;
  final String reason;
  final double amount;
  final DateTime penaltyDate;
  const Penalty(
      {required this.id,
      required this.clientId,
      required this.reason,
      required this.amount,
      required this.penaltyDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['reason'] = Variable<String>(reason);
    map['amount'] = Variable<double>(amount);
    map['penalty_date'] = Variable<DateTime>(penaltyDate);
    return map;
  }

  PenaltiesCompanion toCompanion(bool nullToAbsent) {
    return PenaltiesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      reason: Value(reason),
      amount: Value(amount),
      penaltyDate: Value(penaltyDate),
    );
  }

  factory Penalty.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Penalty(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      reason: serializer.fromJson<String>(json['reason']),
      amount: serializer.fromJson<double>(json['amount']),
      penaltyDate: serializer.fromJson<DateTime>(json['penaltyDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'reason': serializer.toJson<String>(reason),
      'amount': serializer.toJson<double>(amount),
      'penaltyDate': serializer.toJson<DateTime>(penaltyDate),
    };
  }

  Penalty copyWith(
          {int? id,
          int? clientId,
          String? reason,
          double? amount,
          DateTime? penaltyDate}) =>
      Penalty(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        reason: reason ?? this.reason,
        amount: amount ?? this.amount,
        penaltyDate: penaltyDate ?? this.penaltyDate,
      );
  @override
  String toString() {
    return (StringBuffer('Penalty(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('reason: $reason, ')
          ..write('amount: $amount, ')
          ..write('penaltyDate: $penaltyDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, reason, amount, penaltyDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Penalty &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.reason == this.reason &&
          other.amount == this.amount &&
          other.penaltyDate == this.penaltyDate);
}

class PenaltiesCompanion extends UpdateCompanion<Penalty> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> reason;
  final Value<double> amount;
  final Value<DateTime> penaltyDate;
  const PenaltiesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.reason = const Value.absent(),
    this.amount = const Value.absent(),
    this.penaltyDate = const Value.absent(),
  });
  PenaltiesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String reason,
    required double amount,
    required DateTime penaltyDate,
  })  : clientId = Value(clientId),
        reason = Value(reason),
        amount = Value(amount),
        penaltyDate = Value(penaltyDate);
  static Insertable<Penalty> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? reason,
    Expression<double>? amount,
    Expression<DateTime>? penaltyDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (reason != null) 'reason': reason,
      if (amount != null) 'amount': amount,
      if (penaltyDate != null) 'penalty_date': penaltyDate,
    });
  }

  PenaltiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? reason,
      Value<double>? amount,
      Value<DateTime>? penaltyDate}) {
    return PenaltiesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      reason: reason ?? this.reason,
      amount: amount ?? this.amount,
      penaltyDate: penaltyDate ?? this.penaltyDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (penaltyDate.present) {
      map['penalty_date'] = Variable<DateTime>(penaltyDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PenaltiesCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('reason: $reason, ')
          ..write('amount: $amount, ')
          ..write('penaltyDate: $penaltyDate')
          ..write(')'))
        .toString();
  }
}

class $WelfaresTable extends Welfares with TableInfo<$WelfaresTable, Welfare> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WelfaresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, clientId, type, amount, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'welfares';
  @override
  VerificationContext validateIntegrity(Insertable<Welfare> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Welfare map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Welfare(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $WelfaresTable createAlias(String alias) {
    return $WelfaresTable(attachedDatabase, alias);
  }
}

class Welfare extends DataClass implements Insertable<Welfare> {
  final int id;
  final int clientId;
  final String type;
  final double amount;
  final DateTime date;
  const Welfare(
      {required this.id,
      required this.clientId,
      required this.type,
      required this.amount,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  WelfaresCompanion toCompanion(bool nullToAbsent) {
    return WelfaresCompanion(
      id: Value(id),
      clientId: Value(clientId),
      type: Value(type),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory Welfare.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Welfare(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Welfare copyWith(
          {int? id,
          int? clientId,
          String? type,
          double? amount,
          DateTime? date}) =>
      Welfare(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Welfare(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, type, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Welfare &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.date == this.date);
}

class WelfaresCompanion extends UpdateCompanion<Welfare> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> type;
  final Value<double> amount;
  final Value<DateTime> date;
  const WelfaresCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  WelfaresCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String type,
    required double amount,
    required DateTime date,
  })  : clientId = Value(clientId),
        type = Value(type),
        amount = Value(amount),
        date = Value(date);
  static Insertable<Welfare> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  WelfaresCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? type,
      Value<double>? amount,
      Value<DateTime>? date}) {
    return WelfaresCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WelfaresCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $LoansTable loans = $LoansTable(this);
  late final $LoanPaymentsTable loanPayments = $LoanPaymentsTable(this);
  late final $SavingsTable savings = $SavingsTable(this);
  late final $PenaltiesTable penalties = $PenaltiesTable(this);
  late final $WelfaresTable welfares = $WelfaresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, loans, loanPayments, savings, penalties, welfares];
}
