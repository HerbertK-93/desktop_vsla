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
  static const VerificationMeta _penaltyNoMeta =
      const VerificationMeta('penaltyNo');
  @override
  late final GeneratedColumn<String> penaltyNo = GeneratedColumn<String>(
      'penalty_no', aliasedName, false,
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
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, penaltyNo, amount, penaltyDate, reason];
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
    if (data.containsKey('penalty_no')) {
      context.handle(_penaltyNoMeta,
          penaltyNo.isAcceptableOrUnknown(data['penalty_no']!, _penaltyNoMeta));
    } else if (isInserting) {
      context.missing(_penaltyNoMeta);
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
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
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
      penaltyNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}penalty_no'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      penaltyDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}penalty_date'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
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
  final String penaltyNo;
  final double amount;
  final DateTime penaltyDate;
  final String reason;
  const Penalty(
      {required this.id,
      required this.clientId,
      required this.penaltyNo,
      required this.amount,
      required this.penaltyDate,
      required this.reason});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['penalty_no'] = Variable<String>(penaltyNo);
    map['amount'] = Variable<double>(amount);
    map['penalty_date'] = Variable<DateTime>(penaltyDate);
    map['reason'] = Variable<String>(reason);
    return map;
  }

  PenaltiesCompanion toCompanion(bool nullToAbsent) {
    return PenaltiesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      penaltyNo: Value(penaltyNo),
      amount: Value(amount),
      penaltyDate: Value(penaltyDate),
      reason: Value(reason),
    );
  }

  factory Penalty.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Penalty(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      penaltyNo: serializer.fromJson<String>(json['penaltyNo']),
      amount: serializer.fromJson<double>(json['amount']),
      penaltyDate: serializer.fromJson<DateTime>(json['penaltyDate']),
      reason: serializer.fromJson<String>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'penaltyNo': serializer.toJson<String>(penaltyNo),
      'amount': serializer.toJson<double>(amount),
      'penaltyDate': serializer.toJson<DateTime>(penaltyDate),
      'reason': serializer.toJson<String>(reason),
    };
  }

  Penalty copyWith(
          {int? id,
          int? clientId,
          String? penaltyNo,
          double? amount,
          DateTime? penaltyDate,
          String? reason}) =>
      Penalty(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        penaltyNo: penaltyNo ?? this.penaltyNo,
        amount: amount ?? this.amount,
        penaltyDate: penaltyDate ?? this.penaltyDate,
        reason: reason ?? this.reason,
      );
  @override
  String toString() {
    return (StringBuffer('Penalty(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('penaltyNo: $penaltyNo, ')
          ..write('amount: $amount, ')
          ..write('penaltyDate: $penaltyDate, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, penaltyNo, amount, penaltyDate, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Penalty &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.penaltyNo == this.penaltyNo &&
          other.amount == this.amount &&
          other.penaltyDate == this.penaltyDate &&
          other.reason == this.reason);
}

class PenaltiesCompanion extends UpdateCompanion<Penalty> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> penaltyNo;
  final Value<double> amount;
  final Value<DateTime> penaltyDate;
  final Value<String> reason;
  const PenaltiesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.penaltyNo = const Value.absent(),
    this.amount = const Value.absent(),
    this.penaltyDate = const Value.absent(),
    this.reason = const Value.absent(),
  });
  PenaltiesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String penaltyNo,
    required double amount,
    required DateTime penaltyDate,
    required String reason,
  })  : clientId = Value(clientId),
        penaltyNo = Value(penaltyNo),
        amount = Value(amount),
        penaltyDate = Value(penaltyDate),
        reason = Value(reason);
  static Insertable<Penalty> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? penaltyNo,
    Expression<double>? amount,
    Expression<DateTime>? penaltyDate,
    Expression<String>? reason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (penaltyNo != null) 'penalty_no': penaltyNo,
      if (amount != null) 'amount': amount,
      if (penaltyDate != null) 'penalty_date': penaltyDate,
      if (reason != null) 'reason': reason,
    });
  }

  PenaltiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? penaltyNo,
      Value<double>? amount,
      Value<DateTime>? penaltyDate,
      Value<String>? reason}) {
    return PenaltiesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      penaltyNo: penaltyNo ?? this.penaltyNo,
      amount: amount ?? this.amount,
      penaltyDate: penaltyDate ?? this.penaltyDate,
      reason: reason ?? this.reason,
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
    if (penaltyNo.present) {
      map['penalty_no'] = Variable<String>(penaltyNo.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (penaltyDate.present) {
      map['penalty_date'] = Variable<DateTime>(penaltyDate.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PenaltiesCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('penaltyNo: $penaltyNo, ')
          ..write('amount: $amount, ')
          ..write('penaltyDate: $penaltyDate, ')
          ..write('reason: $reason')
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
  static const VerificationMeta _welfareNoMeta =
      const VerificationMeta('welfareNo');
  @override
  late final GeneratedColumn<String> welfareNo = GeneratedColumn<String>(
      'welfare_no', aliasedName, false,
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, welfareNo, amount, date, type];
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
    if (data.containsKey('welfare_no')) {
      context.handle(_welfareNoMeta,
          welfareNo.isAcceptableOrUnknown(data['welfare_no']!, _welfareNoMeta));
    } else if (isInserting) {
      context.missing(_welfareNoMeta);
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
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
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
      welfareNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}welfare_no'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
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
  final String welfareNo;
  final double amount;
  final DateTime date;
  final String type;
  const Welfare(
      {required this.id,
      required this.clientId,
      required this.welfareNo,
      required this.amount,
      required this.date,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['welfare_no'] = Variable<String>(welfareNo);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    return map;
  }

  WelfaresCompanion toCompanion(bool nullToAbsent) {
    return WelfaresCompanion(
      id: Value(id),
      clientId: Value(clientId),
      welfareNo: Value(welfareNo),
      amount: Value(amount),
      date: Value(date),
      type: Value(type),
    );
  }

  factory Welfare.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Welfare(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      welfareNo: serializer.fromJson<String>(json['welfareNo']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'welfareNo': serializer.toJson<String>(welfareNo),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
    };
  }

  Welfare copyWith(
          {int? id,
          int? clientId,
          String? welfareNo,
          double? amount,
          DateTime? date,
          String? type}) =>
      Welfare(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        welfareNo: welfareNo ?? this.welfareNo,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Welfare(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('welfareNo: $welfareNo, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, welfareNo, amount, date, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Welfare &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.welfareNo == this.welfareNo &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.type == this.type);
}

class WelfaresCompanion extends UpdateCompanion<Welfare> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> welfareNo;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<String> type;
  const WelfaresCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.welfareNo = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
  });
  WelfaresCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String welfareNo,
    required double amount,
    required DateTime date,
    required String type,
  })  : clientId = Value(clientId),
        welfareNo = Value(welfareNo),
        amount = Value(amount),
        date = Value(date),
        type = Value(type);
  static Insertable<Welfare> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? welfareNo,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (welfareNo != null) 'welfare_no': welfareNo,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
    });
  }

  WelfaresCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? welfareNo,
      Value<double>? amount,
      Value<DateTime>? date,
      Value<String>? type}) {
    return WelfaresCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      welfareNo: welfareNo ?? this.welfareNo,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      type: type ?? this.type,
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
    if (welfareNo.present) {
      map['welfare_no'] = Variable<String>(welfareNo.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WelfaresCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('welfareNo: $welfareNo, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionsTable extends Subscriptions
    with TableInfo<$SubscriptionsTable, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(Insertable<Subscription> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $SubscriptionsTable createAlias(String alias) {
    return $SubscriptionsTable(attachedDatabase, alias);
  }
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final int id;
  final DateTime date;
  final double amount;
  const Subscription(
      {required this.id, required this.date, required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      id: Value(id),
      date: Value(date),
      amount: Value(amount),
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Subscription copyWith({int? id, DateTime? date, double? amount}) =>
      Subscription(
        id: id ?? this.id,
        date: date ?? this.date,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> amount;
  const SubscriptionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double amount,
  })  : date = Value(date),
        amount = Value(amount);
  static Insertable<Subscription> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
    });
  }

  SubscriptionsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<double>? amount}) {
    return SubscriptionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $InterestIncomeTable extends InterestIncome
    with TableInfo<$InterestIncomeTable, InterestIncomeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterestIncomeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interest_income';
  @override
  VerificationContext validateIntegrity(Insertable<InterestIncomeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InterestIncomeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InterestIncomeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $InterestIncomeTable createAlias(String alias) {
    return $InterestIncomeTable(attachedDatabase, alias);
  }
}

class InterestIncomeData extends DataClass
    implements Insertable<InterestIncomeData> {
  final int id;
  final DateTime date;
  final double amount;
  const InterestIncomeData(
      {required this.id, required this.date, required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  InterestIncomeCompanion toCompanion(bool nullToAbsent) {
    return InterestIncomeCompanion(
      id: Value(id),
      date: Value(date),
      amount: Value(amount),
    );
  }

  factory InterestIncomeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterestIncomeData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
    };
  }

  InterestIncomeData copyWith({int? id, DateTime? date, double? amount}) =>
      InterestIncomeData(
        id: id ?? this.id,
        date: date ?? this.date,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('InterestIncomeData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InterestIncomeData &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount);
}

class InterestIncomeCompanion extends UpdateCompanion<InterestIncomeData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> amount;
  const InterestIncomeCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
  });
  InterestIncomeCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double amount,
  })  : date = Value(date),
        amount = Value(amount);
  static Insertable<InterestIncomeData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
    });
  }

  InterestIncomeCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<double>? amount}) {
    return InterestIncomeCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterestIncomeCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $InvestmentsTable extends Investments
    with TableInfo<$InvestmentsTable, Investment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvestmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'investments';
  @override
  VerificationContext validateIntegrity(Insertable<Investment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Investment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Investment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $InvestmentsTable createAlias(String alias) {
    return $InvestmentsTable(attachedDatabase, alias);
  }
}

class Investment extends DataClass implements Insertable<Investment> {
  final int id;
  final DateTime date;
  final double amount;
  const Investment(
      {required this.id, required this.date, required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  InvestmentsCompanion toCompanion(bool nullToAbsent) {
    return InvestmentsCompanion(
      id: Value(id),
      date: Value(date),
      amount: Value(amount),
    );
  }

  factory Investment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Investment(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Investment copyWith({int? id, DateTime? date, double? amount}) => Investment(
        id: id ?? this.id,
        date: date ?? this.date,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('Investment(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Investment &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount);
}

class InvestmentsCompanion extends UpdateCompanion<Investment> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> amount;
  const InvestmentsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
  });
  InvestmentsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double amount,
  })  : date = Value(date),
        amount = Value(amount);
  static Insertable<Investment> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
    });
  }

  InvestmentsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<double>? amount}) {
    return InvestmentsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvestmentsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $CostsTable extends Costs with TableInfo<$CostsTable, Cost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purposeMeta =
      const VerificationMeta('purpose');
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
      'purpose', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, type, purpose, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'costs';
  @override
  VerificationContext validateIntegrity(Insertable<Cost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cost(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      purpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purpose'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $CostsTable createAlias(String alias) {
    return $CostsTable(attachedDatabase, alias);
  }
}

class Cost extends DataClass implements Insertable<Cost> {
  final int id;
  final DateTime date;
  final String type;
  final String purpose;
  final double amount;
  const Cost(
      {required this.id,
      required this.date,
      required this.type,
      required this.purpose,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    map['purpose'] = Variable<String>(purpose);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  CostsCompanion toCompanion(bool nullToAbsent) {
    return CostsCompanion(
      id: Value(id),
      date: Value(date),
      type: Value(type),
      purpose: Value(purpose),
      amount: Value(amount),
    );
  }

  factory Cost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cost(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      purpose: serializer.fromJson<String>(json['purpose']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'purpose': serializer.toJson<String>(purpose),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Cost copyWith(
          {int? id,
          DateTime? date,
          String? type,
          String? purpose,
          double? amount}) =>
      Cost(
        id: id ?? this.id,
        date: date ?? this.date,
        type: type ?? this.type,
        purpose: purpose ?? this.purpose,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('Cost(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, type, purpose, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cost &&
          other.id == this.id &&
          other.date == this.date &&
          other.type == this.type &&
          other.purpose == this.purpose &&
          other.amount == this.amount);
}

class CostsCompanion extends UpdateCompanion<Cost> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<String> purpose;
  final Value<double> amount;
  const CostsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.purpose = const Value.absent(),
    this.amount = const Value.absent(),
  });
  CostsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String type,
    required String purpose,
    required double amount,
  })  : date = Value(date),
        type = Value(type),
        purpose = Value(purpose),
        amount = Value(amount);
  static Insertable<Cost> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<String>? purpose,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (purpose != null) 'purpose': purpose,
      if (amount != null) 'amount': amount,
    });
  }

  CostsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? type,
      Value<String>? purpose,
      Value<double>? amount}) {
    return CostsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      purpose: purpose ?? this.purpose,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CostsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount')
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
  late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
  late final $InterestIncomeTable interestIncome = $InterestIncomeTable(this);
  late final $InvestmentsTable investments = $InvestmentsTable(this);
  late final $CostsTable costs = $CostsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        clients,
        loans,
        loanPayments,
        savings,
        penalties,
        welfares,
        subscriptions,
        interestIncome,
        investments,
        costs
      ];
}
