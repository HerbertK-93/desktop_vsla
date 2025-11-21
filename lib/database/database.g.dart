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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idNumberMeta = const VerificationMeta(
    'idNumber',
  );
  @override
  late final GeneratedColumn<String> idNumber = GeneratedColumn<String>(
    'id_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idImagePathMeta = const VerificationMeta(
    'idImagePath',
  );
  @override
  late final GeneratedColumn<String> idImagePath = GeneratedColumn<String>(
    'id_image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextOfKinNameMeta = const VerificationMeta(
    'nextOfKinName',
  );
  @override
  late final GeneratedColumn<String> nextOfKinName = GeneratedColumn<String>(
    'next_of_kin_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextOfKinRelationshipMeta =
      const VerificationMeta('nextOfKinRelationship');
  @override
  late final GeneratedColumn<String> nextOfKinRelationship =
      GeneratedColumn<String>(
        'next_of_kin_relationship',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _nextOfKinNINMeta = const VerificationMeta(
    'nextOfKinNIN',
  );
  @override
  late final GeneratedColumn<String> nextOfKinNIN = GeneratedColumn<String>(
    'next_of_kin_n_i_n',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    name,
    idNumber,
    contact,
    address,
    date,
    idImagePath,
    gender,
    dateOfBirth,
    age,
    nextOfKinName,
    nextOfKinRelationship,
    nextOfKinNIN,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Client> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(
        _idNumberMeta,
        idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id_image_path')) {
      context.handle(
        _idImagePathMeta,
        idImagePath.isAcceptableOrUnknown(
          data['id_image_path']!,
          _idImagePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idImagePathMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('next_of_kin_name')) {
      context.handle(
        _nextOfKinNameMeta,
        nextOfKinName.isAcceptableOrUnknown(
          data['next_of_kin_name']!,
          _nextOfKinNameMeta,
        ),
      );
    }
    if (data.containsKey('next_of_kin_relationship')) {
      context.handle(
        _nextOfKinRelationshipMeta,
        nextOfKinRelationship.isAcceptableOrUnknown(
          data['next_of_kin_relationship']!,
          _nextOfKinRelationshipMeta,
        ),
      );
    }
    if (data.containsKey('next_of_kin_n_i_n')) {
      context.handle(
        _nextOfKinNINMeta,
        nextOfKinNIN.isAcceptableOrUnknown(
          data['next_of_kin_n_i_n']!,
          _nextOfKinNINMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      idNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_number'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      idImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_image_path'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      nextOfKinName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_of_kin_name'],
      ),
      nextOfKinRelationship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_of_kin_relationship'],
      ),
      nextOfKinNIN: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_of_kin_n_i_n'],
      ),
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
  final String? gender;
  final DateTime? dateOfBirth;
  final int? age;
  final String? nextOfKinName;
  final String? nextOfKinRelationship;
  final String? nextOfKinNIN;
  const Client({
    required this.id,
    required this.clientId,
    required this.name,
    required this.idNumber,
    required this.contact,
    required this.address,
    required this.date,
    required this.idImagePath,
    this.gender,
    this.dateOfBirth,
    this.age,
    this.nextOfKinName,
    this.nextOfKinRelationship,
    this.nextOfKinNIN,
  });
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
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || nextOfKinName != null) {
      map['next_of_kin_name'] = Variable<String>(nextOfKinName);
    }
    if (!nullToAbsent || nextOfKinRelationship != null) {
      map['next_of_kin_relationship'] = Variable<String>(nextOfKinRelationship);
    }
    if (!nullToAbsent || nextOfKinNIN != null) {
      map['next_of_kin_n_i_n'] = Variable<String>(nextOfKinNIN);
    }
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
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      nextOfKinName: nextOfKinName == null && nullToAbsent
          ? const Value.absent()
          : Value(nextOfKinName),
      nextOfKinRelationship: nextOfKinRelationship == null && nullToAbsent
          ? const Value.absent()
          : Value(nextOfKinRelationship),
      nextOfKinNIN: nextOfKinNIN == null && nullToAbsent
          ? const Value.absent()
          : Value(nextOfKinNIN),
    );
  }

  factory Client.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
      gender: serializer.fromJson<String?>(json['gender']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      age: serializer.fromJson<int?>(json['age']),
      nextOfKinName: serializer.fromJson<String?>(json['nextOfKinName']),
      nextOfKinRelationship: serializer.fromJson<String?>(
        json['nextOfKinRelationship'],
      ),
      nextOfKinNIN: serializer.fromJson<String?>(json['nextOfKinNIN']),
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
      'gender': serializer.toJson<String?>(gender),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'age': serializer.toJson<int?>(age),
      'nextOfKinName': serializer.toJson<String?>(nextOfKinName),
      'nextOfKinRelationship': serializer.toJson<String?>(
        nextOfKinRelationship,
      ),
      'nextOfKinNIN': serializer.toJson<String?>(nextOfKinNIN),
    };
  }

  Client copyWith({
    int? id,
    String? clientId,
    String? name,
    String? idNumber,
    String? contact,
    String? address,
    DateTime? date,
    String? idImagePath,
    Value<String?> gender = const Value.absent(),
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<int?> age = const Value.absent(),
    Value<String?> nextOfKinName = const Value.absent(),
    Value<String?> nextOfKinRelationship = const Value.absent(),
    Value<String?> nextOfKinNIN = const Value.absent(),
  }) => Client(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    name: name ?? this.name,
    idNumber: idNumber ?? this.idNumber,
    contact: contact ?? this.contact,
    address: address ?? this.address,
    date: date ?? this.date,
    idImagePath: idImagePath ?? this.idImagePath,
    gender: gender.present ? gender.value : this.gender,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    age: age.present ? age.value : this.age,
    nextOfKinName: nextOfKinName.present
        ? nextOfKinName.value
        : this.nextOfKinName,
    nextOfKinRelationship: nextOfKinRelationship.present
        ? nextOfKinRelationship.value
        : this.nextOfKinRelationship,
    nextOfKinNIN: nextOfKinNIN.present ? nextOfKinNIN.value : this.nextOfKinNIN,
  );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      name: data.name.present ? data.name.value : this.name,
      idNumber: data.idNumber.present ? data.idNumber.value : this.idNumber,
      contact: data.contact.present ? data.contact.value : this.contact,
      address: data.address.present ? data.address.value : this.address,
      date: data.date.present ? data.date.value : this.date,
      idImagePath: data.idImagePath.present
          ? data.idImagePath.value
          : this.idImagePath,
      gender: data.gender.present ? data.gender.value : this.gender,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      age: data.age.present ? data.age.value : this.age,
      nextOfKinName: data.nextOfKinName.present
          ? data.nextOfKinName.value
          : this.nextOfKinName,
      nextOfKinRelationship: data.nextOfKinRelationship.present
          ? data.nextOfKinRelationship.value
          : this.nextOfKinRelationship,
      nextOfKinNIN: data.nextOfKinNIN.present
          ? data.nextOfKinNIN.value
          : this.nextOfKinNIN,
    );
  }

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
          ..write('idImagePath: $idImagePath, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('age: $age, ')
          ..write('nextOfKinName: $nextOfKinName, ')
          ..write('nextOfKinRelationship: $nextOfKinRelationship, ')
          ..write('nextOfKinNIN: $nextOfKinNIN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    name,
    idNumber,
    contact,
    address,
    date,
    idImagePath,
    gender,
    dateOfBirth,
    age,
    nextOfKinName,
    nextOfKinRelationship,
    nextOfKinNIN,
  );
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
          other.idImagePath == this.idImagePath &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.age == this.age &&
          other.nextOfKinName == this.nextOfKinName &&
          other.nextOfKinRelationship == this.nextOfKinRelationship &&
          other.nextOfKinNIN == this.nextOfKinNIN);
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
  final Value<String?> gender;
  final Value<DateTime?> dateOfBirth;
  final Value<int?> age;
  final Value<String?> nextOfKinName;
  final Value<String?> nextOfKinRelationship;
  final Value<String?> nextOfKinNIN;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.contact = const Value.absent(),
    this.address = const Value.absent(),
    this.date = const Value.absent(),
    this.idImagePath = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.age = const Value.absent(),
    this.nextOfKinName = const Value.absent(),
    this.nextOfKinRelationship = const Value.absent(),
    this.nextOfKinNIN = const Value.absent(),
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
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.age = const Value.absent(),
    this.nextOfKinName = const Value.absent(),
    this.nextOfKinRelationship = const Value.absent(),
    this.nextOfKinNIN = const Value.absent(),
  }) : clientId = Value(clientId),
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
    Expression<String>? gender,
    Expression<DateTime>? dateOfBirth,
    Expression<int>? age,
    Expression<String>? nextOfKinName,
    Expression<String>? nextOfKinRelationship,
    Expression<String>? nextOfKinNIN,
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
      if (gender != null) 'gender': gender,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (age != null) 'age': age,
      if (nextOfKinName != null) 'next_of_kin_name': nextOfKinName,
      if (nextOfKinRelationship != null)
        'next_of_kin_relationship': nextOfKinRelationship,
      if (nextOfKinNIN != null) 'next_of_kin_n_i_n': nextOfKinNIN,
    });
  }

  ClientsCompanion copyWith({
    Value<int>? id,
    Value<String>? clientId,
    Value<String>? name,
    Value<String>? idNumber,
    Value<String>? contact,
    Value<String>? address,
    Value<DateTime>? date,
    Value<String>? idImagePath,
    Value<String?>? gender,
    Value<DateTime?>? dateOfBirth,
    Value<int?>? age,
    Value<String?>? nextOfKinName,
    Value<String?>? nextOfKinRelationship,
    Value<String?>? nextOfKinNIN,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      idNumber: idNumber ?? this.idNumber,
      contact: contact ?? this.contact,
      address: address ?? this.address,
      date: date ?? this.date,
      idImagePath: idImagePath ?? this.idImagePath,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      age: age ?? this.age,
      nextOfKinName: nextOfKinName ?? this.nextOfKinName,
      nextOfKinRelationship:
          nextOfKinRelationship ?? this.nextOfKinRelationship,
      nextOfKinNIN: nextOfKinNIN ?? this.nextOfKinNIN,
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
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (nextOfKinName.present) {
      map['next_of_kin_name'] = Variable<String>(nextOfKinName.value);
    }
    if (nextOfKinRelationship.present) {
      map['next_of_kin_relationship'] = Variable<String>(
        nextOfKinRelationship.value,
      );
    }
    if (nextOfKinNIN.present) {
      map['next_of_kin_n_i_n'] = Variable<String>(nextOfKinNIN.value);
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
          ..write('idImagePath: $idImagePath, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('age: $age, ')
          ..write('nextOfKinName: $nextOfKinName, ')
          ..write('nextOfKinRelationship: $nextOfKinRelationship, ')
          ..write('nextOfKinNIN: $nextOfKinNIN')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issuedDateMeta = const VerificationMeta(
    'issuedDate',
  );
  @override
  late final GeneratedColumn<DateTime> issuedDate = GeneratedColumn<DateTime>(
    'issued_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interestMeta = const VerificationMeta(
    'interest',
  );
  @override
  late final GeneratedColumn<double> interest = GeneratedColumn<double>(
    'interest',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalToPayMeta = const VerificationMeta(
    'totalToPay',
  );
  @override
  late final GeneratedColumn<double> totalToPay = GeneratedColumn<double>(
    'total_to_pay',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repaymentDateMeta = const VerificationMeta(
    'repaymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> repaymentDate =
      GeneratedColumn<DateTime>(
        'repayment_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _interestTypeMeta = const VerificationMeta(
    'interestType',
  );
  @override
  late final GeneratedColumn<String> interestType = GeneratedColumn<String>(
    'interest_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor1NameMeta = const VerificationMeta(
    'guarantor1Name',
  );
  @override
  late final GeneratedColumn<String> guarantor1Name = GeneratedColumn<String>(
    'guarantor1_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor1NINMeta = const VerificationMeta(
    'guarantor1NIN',
  );
  @override
  late final GeneratedColumn<String> guarantor1NIN = GeneratedColumn<String>(
    'guarantor1_n_i_n',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor2NameMeta = const VerificationMeta(
    'guarantor2Name',
  );
  @override
  late final GeneratedColumn<String> guarantor2Name = GeneratedColumn<String>(
    'guarantor2_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor2NINMeta = const VerificationMeta(
    'guarantor2NIN',
  );
  @override
  late final GeneratedColumn<String> guarantor2NIN = GeneratedColumn<String>(
    'guarantor2_n_i_n',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor3NameMeta = const VerificationMeta(
    'guarantor3Name',
  );
  @override
  late final GeneratedColumn<String> guarantor3Name = GeneratedColumn<String>(
    'guarantor3_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guarantor3NINMeta = const VerificationMeta(
    'guarantor3NIN',
  );
  @override
  late final GeneratedColumn<String> guarantor3NIN = GeneratedColumn<String>(
    'guarantor3_n_i_n',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    amount,
    issuedDate,
    interest,
    totalToPay,
    repaymentDate,
    interestType,
    guarantor1Name,
    guarantor1NIN,
    guarantor2Name,
    guarantor2NIN,
    guarantor3Name,
    guarantor3NIN,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loans';
  @override
  VerificationContext validateIntegrity(
    Insertable<Loan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('issued_date')) {
      context.handle(
        _issuedDateMeta,
        issuedDate.isAcceptableOrUnknown(data['issued_date']!, _issuedDateMeta),
      );
    } else if (isInserting) {
      context.missing(_issuedDateMeta);
    }
    if (data.containsKey('interest')) {
      context.handle(
        _interestMeta,
        interest.isAcceptableOrUnknown(data['interest']!, _interestMeta),
      );
    } else if (isInserting) {
      context.missing(_interestMeta);
    }
    if (data.containsKey('total_to_pay')) {
      context.handle(
        _totalToPayMeta,
        totalToPay.isAcceptableOrUnknown(
          data['total_to_pay']!,
          _totalToPayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalToPayMeta);
    }
    if (data.containsKey('repayment_date')) {
      context.handle(
        _repaymentDateMeta,
        repaymentDate.isAcceptableOrUnknown(
          data['repayment_date']!,
          _repaymentDateMeta,
        ),
      );
    }
    if (data.containsKey('interest_type')) {
      context.handle(
        _interestTypeMeta,
        interestType.isAcceptableOrUnknown(
          data['interest_type']!,
          _interestTypeMeta,
        ),
      );
    }
    if (data.containsKey('guarantor1_name')) {
      context.handle(
        _guarantor1NameMeta,
        guarantor1Name.isAcceptableOrUnknown(
          data['guarantor1_name']!,
          _guarantor1NameMeta,
        ),
      );
    }
    if (data.containsKey('guarantor1_n_i_n')) {
      context.handle(
        _guarantor1NINMeta,
        guarantor1NIN.isAcceptableOrUnknown(
          data['guarantor1_n_i_n']!,
          _guarantor1NINMeta,
        ),
      );
    }
    if (data.containsKey('guarantor2_name')) {
      context.handle(
        _guarantor2NameMeta,
        guarantor2Name.isAcceptableOrUnknown(
          data['guarantor2_name']!,
          _guarantor2NameMeta,
        ),
      );
    }
    if (data.containsKey('guarantor2_n_i_n')) {
      context.handle(
        _guarantor2NINMeta,
        guarantor2NIN.isAcceptableOrUnknown(
          data['guarantor2_n_i_n']!,
          _guarantor2NINMeta,
        ),
      );
    }
    if (data.containsKey('guarantor3_name')) {
      context.handle(
        _guarantor3NameMeta,
        guarantor3Name.isAcceptableOrUnknown(
          data['guarantor3_name']!,
          _guarantor3NameMeta,
        ),
      );
    }
    if (data.containsKey('guarantor3_n_i_n')) {
      context.handle(
        _guarantor3NINMeta,
        guarantor3NIN.isAcceptableOrUnknown(
          data['guarantor3_n_i_n']!,
          _guarantor3NINMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Loan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Loan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      issuedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issued_date'],
      )!,
      interest: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}interest'],
      )!,
      totalToPay: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_to_pay'],
      )!,
      repaymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}repayment_date'],
      ),
      interestType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interest_type'],
      ),
      guarantor1Name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor1_name'],
      ),
      guarantor1NIN: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor1_n_i_n'],
      ),
      guarantor2Name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor2_name'],
      ),
      guarantor2NIN: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor2_n_i_n'],
      ),
      guarantor3Name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor3_name'],
      ),
      guarantor3NIN: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guarantor3_n_i_n'],
      ),
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
  final DateTime? repaymentDate;
  final String? interestType;
  final String? guarantor1Name;
  final String? guarantor1NIN;
  final String? guarantor2Name;
  final String? guarantor2NIN;
  final String? guarantor3Name;
  final String? guarantor3NIN;
  const Loan({
    required this.id,
    required this.clientId,
    required this.amount,
    required this.issuedDate,
    required this.interest,
    required this.totalToPay,
    this.repaymentDate,
    this.interestType,
    this.guarantor1Name,
    this.guarantor1NIN,
    this.guarantor2Name,
    this.guarantor2NIN,
    this.guarantor3Name,
    this.guarantor3NIN,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['amount'] = Variable<double>(amount);
    map['issued_date'] = Variable<DateTime>(issuedDate);
    map['interest'] = Variable<double>(interest);
    map['total_to_pay'] = Variable<double>(totalToPay);
    if (!nullToAbsent || repaymentDate != null) {
      map['repayment_date'] = Variable<DateTime>(repaymentDate);
    }
    if (!nullToAbsent || interestType != null) {
      map['interest_type'] = Variable<String>(interestType);
    }
    if (!nullToAbsent || guarantor1Name != null) {
      map['guarantor1_name'] = Variable<String>(guarantor1Name);
    }
    if (!nullToAbsent || guarantor1NIN != null) {
      map['guarantor1_n_i_n'] = Variable<String>(guarantor1NIN);
    }
    if (!nullToAbsent || guarantor2Name != null) {
      map['guarantor2_name'] = Variable<String>(guarantor2Name);
    }
    if (!nullToAbsent || guarantor2NIN != null) {
      map['guarantor2_n_i_n'] = Variable<String>(guarantor2NIN);
    }
    if (!nullToAbsent || guarantor3Name != null) {
      map['guarantor3_name'] = Variable<String>(guarantor3Name);
    }
    if (!nullToAbsent || guarantor3NIN != null) {
      map['guarantor3_n_i_n'] = Variable<String>(guarantor3NIN);
    }
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
      repaymentDate: repaymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(repaymentDate),
      interestType: interestType == null && nullToAbsent
          ? const Value.absent()
          : Value(interestType),
      guarantor1Name: guarantor1Name == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor1Name),
      guarantor1NIN: guarantor1NIN == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor1NIN),
      guarantor2Name: guarantor2Name == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor2Name),
      guarantor2NIN: guarantor2NIN == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor2NIN),
      guarantor3Name: guarantor3Name == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor3Name),
      guarantor3NIN: guarantor3NIN == null && nullToAbsent
          ? const Value.absent()
          : Value(guarantor3NIN),
    );
  }

  factory Loan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Loan(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      amount: serializer.fromJson<double>(json['amount']),
      issuedDate: serializer.fromJson<DateTime>(json['issuedDate']),
      interest: serializer.fromJson<double>(json['interest']),
      totalToPay: serializer.fromJson<double>(json['totalToPay']),
      repaymentDate: serializer.fromJson<DateTime?>(json['repaymentDate']),
      interestType: serializer.fromJson<String?>(json['interestType']),
      guarantor1Name: serializer.fromJson<String?>(json['guarantor1Name']),
      guarantor1NIN: serializer.fromJson<String?>(json['guarantor1NIN']),
      guarantor2Name: serializer.fromJson<String?>(json['guarantor2Name']),
      guarantor2NIN: serializer.fromJson<String?>(json['guarantor2NIN']),
      guarantor3Name: serializer.fromJson<String?>(json['guarantor3Name']),
      guarantor3NIN: serializer.fromJson<String?>(json['guarantor3NIN']),
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
      'repaymentDate': serializer.toJson<DateTime?>(repaymentDate),
      'interestType': serializer.toJson<String?>(interestType),
      'guarantor1Name': serializer.toJson<String?>(guarantor1Name),
      'guarantor1NIN': serializer.toJson<String?>(guarantor1NIN),
      'guarantor2Name': serializer.toJson<String?>(guarantor2Name),
      'guarantor2NIN': serializer.toJson<String?>(guarantor2NIN),
      'guarantor3Name': serializer.toJson<String?>(guarantor3Name),
      'guarantor3NIN': serializer.toJson<String?>(guarantor3NIN),
    };
  }

  Loan copyWith({
    int? id,
    int? clientId,
    double? amount,
    DateTime? issuedDate,
    double? interest,
    double? totalToPay,
    Value<DateTime?> repaymentDate = const Value.absent(),
    Value<String?> interestType = const Value.absent(),
    Value<String?> guarantor1Name = const Value.absent(),
    Value<String?> guarantor1NIN = const Value.absent(),
    Value<String?> guarantor2Name = const Value.absent(),
    Value<String?> guarantor2NIN = const Value.absent(),
    Value<String?> guarantor3Name = const Value.absent(),
    Value<String?> guarantor3NIN = const Value.absent(),
  }) => Loan(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    amount: amount ?? this.amount,
    issuedDate: issuedDate ?? this.issuedDate,
    interest: interest ?? this.interest,
    totalToPay: totalToPay ?? this.totalToPay,
    repaymentDate: repaymentDate.present
        ? repaymentDate.value
        : this.repaymentDate,
    interestType: interestType.present ? interestType.value : this.interestType,
    guarantor1Name: guarantor1Name.present
        ? guarantor1Name.value
        : this.guarantor1Name,
    guarantor1NIN: guarantor1NIN.present
        ? guarantor1NIN.value
        : this.guarantor1NIN,
    guarantor2Name: guarantor2Name.present
        ? guarantor2Name.value
        : this.guarantor2Name,
    guarantor2NIN: guarantor2NIN.present
        ? guarantor2NIN.value
        : this.guarantor2NIN,
    guarantor3Name: guarantor3Name.present
        ? guarantor3Name.value
        : this.guarantor3Name,
    guarantor3NIN: guarantor3NIN.present
        ? guarantor3NIN.value
        : this.guarantor3NIN,
  );
  Loan copyWithCompanion(LoansCompanion data) {
    return Loan(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      amount: data.amount.present ? data.amount.value : this.amount,
      issuedDate: data.issuedDate.present
          ? data.issuedDate.value
          : this.issuedDate,
      interest: data.interest.present ? data.interest.value : this.interest,
      totalToPay: data.totalToPay.present
          ? data.totalToPay.value
          : this.totalToPay,
      repaymentDate: data.repaymentDate.present
          ? data.repaymentDate.value
          : this.repaymentDate,
      interestType: data.interestType.present
          ? data.interestType.value
          : this.interestType,
      guarantor1Name: data.guarantor1Name.present
          ? data.guarantor1Name.value
          : this.guarantor1Name,
      guarantor1NIN: data.guarantor1NIN.present
          ? data.guarantor1NIN.value
          : this.guarantor1NIN,
      guarantor2Name: data.guarantor2Name.present
          ? data.guarantor2Name.value
          : this.guarantor2Name,
      guarantor2NIN: data.guarantor2NIN.present
          ? data.guarantor2NIN.value
          : this.guarantor2NIN,
      guarantor3Name: data.guarantor3Name.present
          ? data.guarantor3Name.value
          : this.guarantor3Name,
      guarantor3NIN: data.guarantor3NIN.present
          ? data.guarantor3NIN.value
          : this.guarantor3NIN,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Loan(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('amount: $amount, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('interest: $interest, ')
          ..write('totalToPay: $totalToPay, ')
          ..write('repaymentDate: $repaymentDate, ')
          ..write('interestType: $interestType, ')
          ..write('guarantor1Name: $guarantor1Name, ')
          ..write('guarantor1NIN: $guarantor1NIN, ')
          ..write('guarantor2Name: $guarantor2Name, ')
          ..write('guarantor2NIN: $guarantor2NIN, ')
          ..write('guarantor3Name: $guarantor3Name, ')
          ..write('guarantor3NIN: $guarantor3NIN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    amount,
    issuedDate,
    interest,
    totalToPay,
    repaymentDate,
    interestType,
    guarantor1Name,
    guarantor1NIN,
    guarantor2Name,
    guarantor2NIN,
    guarantor3Name,
    guarantor3NIN,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Loan &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.amount == this.amount &&
          other.issuedDate == this.issuedDate &&
          other.interest == this.interest &&
          other.totalToPay == this.totalToPay &&
          other.repaymentDate == this.repaymentDate &&
          other.interestType == this.interestType &&
          other.guarantor1Name == this.guarantor1Name &&
          other.guarantor1NIN == this.guarantor1NIN &&
          other.guarantor2Name == this.guarantor2Name &&
          other.guarantor2NIN == this.guarantor2NIN &&
          other.guarantor3Name == this.guarantor3Name &&
          other.guarantor3NIN == this.guarantor3NIN);
}

class LoansCompanion extends UpdateCompanion<Loan> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<double> amount;
  final Value<DateTime> issuedDate;
  final Value<double> interest;
  final Value<double> totalToPay;
  final Value<DateTime?> repaymentDate;
  final Value<String?> interestType;
  final Value<String?> guarantor1Name;
  final Value<String?> guarantor1NIN;
  final Value<String?> guarantor2Name;
  final Value<String?> guarantor2NIN;
  final Value<String?> guarantor3Name;
  final Value<String?> guarantor3NIN;
  const LoansCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.amount = const Value.absent(),
    this.issuedDate = const Value.absent(),
    this.interest = const Value.absent(),
    this.totalToPay = const Value.absent(),
    this.repaymentDate = const Value.absent(),
    this.interestType = const Value.absent(),
    this.guarantor1Name = const Value.absent(),
    this.guarantor1NIN = const Value.absent(),
    this.guarantor2Name = const Value.absent(),
    this.guarantor2NIN = const Value.absent(),
    this.guarantor3Name = const Value.absent(),
    this.guarantor3NIN = const Value.absent(),
  });
  LoansCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required double amount,
    required DateTime issuedDate,
    required double interest,
    required double totalToPay,
    this.repaymentDate = const Value.absent(),
    this.interestType = const Value.absent(),
    this.guarantor1Name = const Value.absent(),
    this.guarantor1NIN = const Value.absent(),
    this.guarantor2Name = const Value.absent(),
    this.guarantor2NIN = const Value.absent(),
    this.guarantor3Name = const Value.absent(),
    this.guarantor3NIN = const Value.absent(),
  }) : clientId = Value(clientId),
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
    Expression<DateTime>? repaymentDate,
    Expression<String>? interestType,
    Expression<String>? guarantor1Name,
    Expression<String>? guarantor1NIN,
    Expression<String>? guarantor2Name,
    Expression<String>? guarantor2NIN,
    Expression<String>? guarantor3Name,
    Expression<String>? guarantor3NIN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (amount != null) 'amount': amount,
      if (issuedDate != null) 'issued_date': issuedDate,
      if (interest != null) 'interest': interest,
      if (totalToPay != null) 'total_to_pay': totalToPay,
      if (repaymentDate != null) 'repayment_date': repaymentDate,
      if (interestType != null) 'interest_type': interestType,
      if (guarantor1Name != null) 'guarantor1_name': guarantor1Name,
      if (guarantor1NIN != null) 'guarantor1_n_i_n': guarantor1NIN,
      if (guarantor2Name != null) 'guarantor2_name': guarantor2Name,
      if (guarantor2NIN != null) 'guarantor2_n_i_n': guarantor2NIN,
      if (guarantor3Name != null) 'guarantor3_name': guarantor3Name,
      if (guarantor3NIN != null) 'guarantor3_n_i_n': guarantor3NIN,
    });
  }

  LoansCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<double>? amount,
    Value<DateTime>? issuedDate,
    Value<double>? interest,
    Value<double>? totalToPay,
    Value<DateTime?>? repaymentDate,
    Value<String?>? interestType,
    Value<String?>? guarantor1Name,
    Value<String?>? guarantor1NIN,
    Value<String?>? guarantor2Name,
    Value<String?>? guarantor2NIN,
    Value<String?>? guarantor3Name,
    Value<String?>? guarantor3NIN,
  }) {
    return LoansCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      amount: amount ?? this.amount,
      issuedDate: issuedDate ?? this.issuedDate,
      interest: interest ?? this.interest,
      totalToPay: totalToPay ?? this.totalToPay,
      repaymentDate: repaymentDate ?? this.repaymentDate,
      interestType: interestType ?? this.interestType,
      guarantor1Name: guarantor1Name ?? this.guarantor1Name,
      guarantor1NIN: guarantor1NIN ?? this.guarantor1NIN,
      guarantor2Name: guarantor2Name ?? this.guarantor2Name,
      guarantor2NIN: guarantor2NIN ?? this.guarantor2NIN,
      guarantor3Name: guarantor3Name ?? this.guarantor3Name,
      guarantor3NIN: guarantor3NIN ?? this.guarantor3NIN,
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
    if (repaymentDate.present) {
      map['repayment_date'] = Variable<DateTime>(repaymentDate.value);
    }
    if (interestType.present) {
      map['interest_type'] = Variable<String>(interestType.value);
    }
    if (guarantor1Name.present) {
      map['guarantor1_name'] = Variable<String>(guarantor1Name.value);
    }
    if (guarantor1NIN.present) {
      map['guarantor1_n_i_n'] = Variable<String>(guarantor1NIN.value);
    }
    if (guarantor2Name.present) {
      map['guarantor2_name'] = Variable<String>(guarantor2Name.value);
    }
    if (guarantor2NIN.present) {
      map['guarantor2_n_i_n'] = Variable<String>(guarantor2NIN.value);
    }
    if (guarantor3Name.present) {
      map['guarantor3_name'] = Variable<String>(guarantor3Name.value);
    }
    if (guarantor3NIN.present) {
      map['guarantor3_n_i_n'] = Variable<String>(guarantor3NIN.value);
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
          ..write('totalToPay: $totalToPay, ')
          ..write('repaymentDate: $repaymentDate, ')
          ..write('interestType: $interestType, ')
          ..write('guarantor1Name: $guarantor1Name, ')
          ..write('guarantor1NIN: $guarantor1NIN, ')
          ..write('guarantor2Name: $guarantor2Name, ')
          ..write('guarantor2NIN: $guarantor2NIN, ')
          ..write('guarantor3Name: $guarantor3Name, ')
          ..write('guarantor3NIN: $guarantor3NIN')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentNoMeta = const VerificationMeta(
    'paymentNo',
  );
  @override
  late final GeneratedColumn<String> paymentNo = GeneratedColumn<String>(
    'payment_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalToPayMeta = const VerificationMeta(
    'totalToPay',
  );
  @override
  late final GeneratedColumn<double> totalToPay = GeneratedColumn<double>(
    'total_to_pay',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remainingBalanceMeta = const VerificationMeta(
    'remainingBalance',
  );
  @override
  late final GeneratedColumn<double> remainingBalance = GeneratedColumn<double>(
    'remaining_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    paymentDate,
    paymentNo,
    totalToPay,
    amount,
    remainingBalance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoanPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('payment_no')) {
      context.handle(
        _paymentNoMeta,
        paymentNo.isAcceptableOrUnknown(data['payment_no']!, _paymentNoMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentNoMeta);
    }
    if (data.containsKey('total_to_pay')) {
      context.handle(
        _totalToPayMeta,
        totalToPay.isAcceptableOrUnknown(
          data['total_to_pay']!,
          _totalToPayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalToPayMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('remaining_balance')) {
      context.handle(
        _remainingBalanceMeta,
        remainingBalance.isAcceptableOrUnknown(
          data['remaining_balance']!,
          _remainingBalanceMeta,
        ),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      )!,
      paymentNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_no'],
      )!,
      totalToPay: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_to_pay'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      remainingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}remaining_balance'],
      )!,
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
  const LoanPayment({
    required this.id,
    required this.clientId,
    required this.paymentDate,
    required this.paymentNo,
    required this.totalToPay,
    required this.amount,
    required this.remainingBalance,
  });
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

  factory LoanPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  LoanPayment copyWith({
    int? id,
    int? clientId,
    DateTime? paymentDate,
    String? paymentNo,
    double? totalToPay,
    double? amount,
    double? remainingBalance,
  }) => LoanPayment(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    paymentDate: paymentDate ?? this.paymentDate,
    paymentNo: paymentNo ?? this.paymentNo,
    totalToPay: totalToPay ?? this.totalToPay,
    amount: amount ?? this.amount,
    remainingBalance: remainingBalance ?? this.remainingBalance,
  );
  LoanPayment copyWithCompanion(LoanPaymentsCompanion data) {
    return LoanPayment(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      paymentNo: data.paymentNo.present ? data.paymentNo.value : this.paymentNo,
      totalToPay: data.totalToPay.present
          ? data.totalToPay.value
          : this.totalToPay,
      amount: data.amount.present ? data.amount.value : this.amount,
      remainingBalance: data.remainingBalance.present
          ? data.remainingBalance.value
          : this.remainingBalance,
    );
  }

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
  int get hashCode => Object.hash(
    id,
    clientId,
    paymentDate,
    paymentNo,
    totalToPay,
    amount,
    remainingBalance,
  );
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
  }) : clientId = Value(clientId),
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

  LoanPaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<DateTime>? paymentDate,
    Value<String>? paymentNo,
    Value<double>? totalToPay,
    Value<double>? amount,
    Value<double>? remainingBalance,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _savingNoMeta = const VerificationMeta(
    'savingNo',
  );
  @override
  late final GeneratedColumn<String> savingNo = GeneratedColumn<String>(
    'saving_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savingDateMeta = const VerificationMeta(
    'savingDate',
  );
  @override
  late final GeneratedColumn<DateTime> savingDate = GeneratedColumn<DateTime>(
    'saving_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    savingNo,
    amount,
    savingDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Saving> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('saving_no')) {
      context.handle(
        _savingNoMeta,
        savingNo.isAcceptableOrUnknown(data['saving_no']!, _savingNoMeta),
      );
    } else if (isInserting) {
      context.missing(_savingNoMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('saving_date')) {
      context.handle(
        _savingDateMeta,
        savingDate.isAcceptableOrUnknown(data['saving_date']!, _savingDateMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      savingNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saving_no'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      savingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saving_date'],
      )!,
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
  const Saving({
    required this.id,
    required this.clientId,
    required this.savingNo,
    required this.amount,
    required this.savingDate,
  });
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

  factory Saving.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  Saving copyWith({
    int? id,
    int? clientId,
    String? savingNo,
    double? amount,
    DateTime? savingDate,
  }) => Saving(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    savingNo: savingNo ?? this.savingNo,
    amount: amount ?? this.amount,
    savingDate: savingDate ?? this.savingDate,
  );
  Saving copyWithCompanion(SavingsCompanion data) {
    return Saving(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      savingNo: data.savingNo.present ? data.savingNo.value : this.savingNo,
      amount: data.amount.present ? data.amount.value : this.amount,
      savingDate: data.savingDate.present
          ? data.savingDate.value
          : this.savingDate,
    );
  }

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
  }) : clientId = Value(clientId),
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

  SavingsCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<String>? savingNo,
    Value<double>? amount,
    Value<DateTime>? savingDate,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _penaltyNoMeta = const VerificationMeta(
    'penaltyNo',
  );
  @override
  late final GeneratedColumn<String> penaltyNo = GeneratedColumn<String>(
    'penalty_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _penaltyDateMeta = const VerificationMeta(
    'penaltyDate',
  );
  @override
  late final GeneratedColumn<DateTime> penaltyDate = GeneratedColumn<DateTime>(
    'penalty_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    penaltyNo,
    amount,
    penaltyDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'penalties';
  @override
  VerificationContext validateIntegrity(
    Insertable<Penalty> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('penalty_no')) {
      context.handle(
        _penaltyNoMeta,
        penaltyNo.isAcceptableOrUnknown(data['penalty_no']!, _penaltyNoMeta),
      );
    } else if (isInserting) {
      context.missing(_penaltyNoMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('penalty_date')) {
      context.handle(
        _penaltyDateMeta,
        penaltyDate.isAcceptableOrUnknown(
          data['penalty_date']!,
          _penaltyDateMeta,
        ),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      penaltyNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}penalty_no'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      penaltyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}penalty_date'],
      )!,
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
  const Penalty({
    required this.id,
    required this.clientId,
    required this.penaltyNo,
    required this.amount,
    required this.penaltyDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['penalty_no'] = Variable<String>(penaltyNo);
    map['amount'] = Variable<double>(amount);
    map['penalty_date'] = Variable<DateTime>(penaltyDate);
    return map;
  }

  PenaltiesCompanion toCompanion(bool nullToAbsent) {
    return PenaltiesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      penaltyNo: Value(penaltyNo),
      amount: Value(amount),
      penaltyDate: Value(penaltyDate),
    );
  }

  factory Penalty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Penalty(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      penaltyNo: serializer.fromJson<String>(json['penaltyNo']),
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
      'penaltyNo': serializer.toJson<String>(penaltyNo),
      'amount': serializer.toJson<double>(amount),
      'penaltyDate': serializer.toJson<DateTime>(penaltyDate),
    };
  }

  Penalty copyWith({
    int? id,
    int? clientId,
    String? penaltyNo,
    double? amount,
    DateTime? penaltyDate,
  }) => Penalty(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    penaltyNo: penaltyNo ?? this.penaltyNo,
    amount: amount ?? this.amount,
    penaltyDate: penaltyDate ?? this.penaltyDate,
  );
  Penalty copyWithCompanion(PenaltiesCompanion data) {
    return Penalty(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      penaltyNo: data.penaltyNo.present ? data.penaltyNo.value : this.penaltyNo,
      amount: data.amount.present ? data.amount.value : this.amount,
      penaltyDate: data.penaltyDate.present
          ? data.penaltyDate.value
          : this.penaltyDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Penalty(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('penaltyNo: $penaltyNo, ')
          ..write('amount: $amount, ')
          ..write('penaltyDate: $penaltyDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, penaltyNo, amount, penaltyDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Penalty &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.penaltyNo == this.penaltyNo &&
          other.amount == this.amount &&
          other.penaltyDate == this.penaltyDate);
}

class PenaltiesCompanion extends UpdateCompanion<Penalty> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> penaltyNo;
  final Value<double> amount;
  final Value<DateTime> penaltyDate;
  const PenaltiesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.penaltyNo = const Value.absent(),
    this.amount = const Value.absent(),
    this.penaltyDate = const Value.absent(),
  });
  PenaltiesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String penaltyNo,
    required double amount,
    required DateTime penaltyDate,
  }) : clientId = Value(clientId),
       penaltyNo = Value(penaltyNo),
       amount = Value(amount),
       penaltyDate = Value(penaltyDate);
  static Insertable<Penalty> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? penaltyNo,
    Expression<double>? amount,
    Expression<DateTime>? penaltyDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (penaltyNo != null) 'penalty_no': penaltyNo,
      if (amount != null) 'amount': amount,
      if (penaltyDate != null) 'penalty_date': penaltyDate,
    });
  }

  PenaltiesCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<String>? penaltyNo,
    Value<double>? amount,
    Value<DateTime>? penaltyDate,
  }) {
    return PenaltiesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      penaltyNo: penaltyNo ?? this.penaltyNo,
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
    if (penaltyNo.present) {
      map['penalty_no'] = Variable<String>(penaltyNo.value);
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
          ..write('penaltyNo: $penaltyNo, ')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _welfareNoMeta = const VerificationMeta(
    'welfareNo',
  );
  @override
  late final GeneratedColumn<String> welfareNo = GeneratedColumn<String>(
    'welfare_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, clientId, welfareNo, amount, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'welfares';
  @override
  VerificationContext validateIntegrity(
    Insertable<Welfare> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('welfare_no')) {
      context.handle(
        _welfareNoMeta,
        welfareNo.isAcceptableOrUnknown(data['welfare_no']!, _welfareNoMeta),
      );
    } else if (isInserting) {
      context.missing(_welfareNoMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      welfareNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}welfare_no'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
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
  const Welfare({
    required this.id,
    required this.clientId,
    required this.welfareNo,
    required this.amount,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['welfare_no'] = Variable<String>(welfareNo);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  WelfaresCompanion toCompanion(bool nullToAbsent) {
    return WelfaresCompanion(
      id: Value(id),
      clientId: Value(clientId),
      welfareNo: Value(welfareNo),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory Welfare.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Welfare(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      welfareNo: serializer.fromJson<String>(json['welfareNo']),
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
      'welfareNo': serializer.toJson<String>(welfareNo),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Welfare copyWith({
    int? id,
    int? clientId,
    String? welfareNo,
    double? amount,
    DateTime? date,
  }) => Welfare(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    welfareNo: welfareNo ?? this.welfareNo,
    amount: amount ?? this.amount,
    date: date ?? this.date,
  );
  Welfare copyWithCompanion(WelfaresCompanion data) {
    return Welfare(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      welfareNo: data.welfareNo.present ? data.welfareNo.value : this.welfareNo,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Welfare(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('welfareNo: $welfareNo, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, welfareNo, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Welfare &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.welfareNo == this.welfareNo &&
          other.amount == this.amount &&
          other.date == this.date);
}

class WelfaresCompanion extends UpdateCompanion<Welfare> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> welfareNo;
  final Value<double> amount;
  final Value<DateTime> date;
  const WelfaresCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.welfareNo = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  WelfaresCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String welfareNo,
    required double amount,
    required DateTime date,
  }) : clientId = Value(clientId),
       welfareNo = Value(welfareNo),
       amount = Value(amount),
       date = Value(date);
  static Insertable<Welfare> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? welfareNo,
    Expression<double>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (welfareNo != null) 'welfare_no': welfareNo,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  WelfaresCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<String>? welfareNo,
    Value<double>? amount,
    Value<DateTime>? date,
  }) {
    return WelfaresCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      welfareNo: welfareNo ?? this.welfareNo,
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
    if (welfareNo.present) {
      map['welfare_no'] = Variable<String>(welfareNo.value);
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
          ..write('welfareNo: $welfareNo, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
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
  const Subscription({
    required this.id,
    required this.date,
    required this.amount,
  });
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

  factory Subscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
  Subscription copyWithCompanion(SubscriptionsCompanion data) {
    return Subscription(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

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
  }) : date = Value(date),
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

  SubscriptionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? amount,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interest_income';
  @override
  VerificationContext validateIntegrity(
    Insertable<InterestIncomeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
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
  const InterestIncomeData({
    required this.id,
    required this.date,
    required this.amount,
  });
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

  factory InterestIncomeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
  InterestIncomeData copyWithCompanion(InterestIncomeCompanion data) {
    return InterestIncomeData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

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
  }) : date = Value(date),
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

  InterestIncomeCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? amount,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'investments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Investment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
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
  const Investment({
    required this.id,
    required this.date,
    required this.amount,
  });
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

  factory Investment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
  Investment copyWithCompanion(InvestmentsCompanion data) {
    return Investment(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

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
  }) : date = Value(date),
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

  InvestmentsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? amount,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purposeMeta = const VerificationMeta(
    'purpose',
  );
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
    'purpose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, type, purpose, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'costs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cost> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(
        _purposeMeta,
        purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta),
      );
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      purpose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
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
  const Cost({
    required this.id,
    required this.date,
    required this.type,
    required this.purpose,
    required this.amount,
  });
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

  factory Cost.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  Cost copyWith({
    int? id,
    DateTime? date,
    String? type,
    String? purpose,
    double? amount,
  }) => Cost(
    id: id ?? this.id,
    date: date ?? this.date,
    type: type ?? this.type,
    purpose: purpose ?? this.purpose,
    amount: amount ?? this.amount,
  );
  Cost copyWithCompanion(CostsCompanion data) {
    return Cost(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

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
  }) : date = Value(date),
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

  CostsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? type,
    Value<String>? purpose,
    Value<double>? amount,
  }) {
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
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
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
    costs,
  ];
}

typedef $$ClientsTableCreateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      required String clientId,
      required String name,
      required String idNumber,
      required String contact,
      required String address,
      required DateTime date,
      required String idImagePath,
      Value<String?> gender,
      Value<DateTime?> dateOfBirth,
      Value<int?> age,
      Value<String?> nextOfKinName,
      Value<String?> nextOfKinRelationship,
      Value<String?> nextOfKinNIN,
    });
typedef $$ClientsTableUpdateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      Value<String> clientId,
      Value<String> name,
      Value<String> idNumber,
      Value<String> contact,
      Value<String> address,
      Value<DateTime> date,
      Value<String> idImagePath,
      Value<String?> gender,
      Value<DateTime?> dateOfBirth,
      Value<int?> age,
      Value<String?> nextOfKinName,
      Value<String?> nextOfKinRelationship,
      Value<String?> nextOfKinNIN,
    });

final class $$ClientsTableReferences
    extends BaseReferences<_$AppDatabase, $ClientsTable, Client> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LoansTable, List<Loan>> _loansRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.loans,
    aliasName: $_aliasNameGenerator(db.clients.id, db.loans.clientId),
  );

  $$LoansTableProcessedTableManager get loansRefs {
    final manager = $$LoansTableTableManager(
      $_db,
      $_db.loans,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_loansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LoanPaymentsTable, List<LoanPayment>>
  _loanPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.loanPayments,
    aliasName: $_aliasNameGenerator(db.clients.id, db.loanPayments.clientId),
  );

  $$LoanPaymentsTableProcessedTableManager get loanPaymentsRefs {
    final manager = $$LoanPaymentsTableTableManager(
      $_db,
      $_db.loanPayments,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_loanPaymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SavingsTable, List<Saving>> _savingsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.savings,
    aliasName: $_aliasNameGenerator(db.clients.id, db.savings.clientId),
  );

  $$SavingsTableProcessedTableManager get savingsRefs {
    final manager = $$SavingsTableTableManager(
      $_db,
      $_db.savings,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_savingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PenaltiesTable, List<Penalty>>
  _penaltiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.penalties,
    aliasName: $_aliasNameGenerator(db.clients.id, db.penalties.clientId),
  );

  $$PenaltiesTableProcessedTableManager get penaltiesRefs {
    final manager = $$PenaltiesTableTableManager(
      $_db,
      $_db.penalties,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_penaltiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WelfaresTable, List<Welfare>> _welfaresRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.welfares,
    aliasName: $_aliasNameGenerator(db.clients.id, db.welfares.clientId),
  );

  $$WelfaresTableProcessedTableManager get welfaresRefs {
    final manager = $$WelfaresTableTableManager(
      $_db,
      $_db.welfares,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_welfaresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idNumber => $composableBuilder(
    column: $table.idNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idImagePath => $composableBuilder(
    column: $table.idImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextOfKinName => $composableBuilder(
    column: $table.nextOfKinName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextOfKinRelationship => $composableBuilder(
    column: $table.nextOfKinRelationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextOfKinNIN => $composableBuilder(
    column: $table.nextOfKinNIN,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> loansRefs(
    Expression<bool> Function($$LoansTableFilterComposer f) f,
  ) {
    final $$LoansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loans,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoansTableFilterComposer(
            $db: $db,
            $table: $db.loans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> loanPaymentsRefs(
    Expression<bool> Function($$LoanPaymentsTableFilterComposer f) f,
  ) {
    final $$LoanPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loanPayments,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.loanPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> savingsRefs(
    Expression<bool> Function($$SavingsTableFilterComposer f) f,
  ) {
    final $$SavingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savings,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsTableFilterComposer(
            $db: $db,
            $table: $db.savings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> penaltiesRefs(
    Expression<bool> Function($$PenaltiesTableFilterComposer f) f,
  ) {
    final $$PenaltiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.penalties,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenaltiesTableFilterComposer(
            $db: $db,
            $table: $db.penalties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> welfaresRefs(
    Expression<bool> Function($$WelfaresTableFilterComposer f) f,
  ) {
    final $$WelfaresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.welfares,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WelfaresTableFilterComposer(
            $db: $db,
            $table: $db.welfares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idNumber => $composableBuilder(
    column: $table.idNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idImagePath => $composableBuilder(
    column: $table.idImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextOfKinName => $composableBuilder(
    column: $table.nextOfKinName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextOfKinRelationship => $composableBuilder(
    column: $table.nextOfKinRelationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextOfKinNIN => $composableBuilder(
    column: $table.nextOfKinNIN,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get idNumber =>
      $composableBuilder(column: $table.idNumber, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get idImagePath => $composableBuilder(
    column: $table.idImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get nextOfKinName => $composableBuilder(
    column: $table.nextOfKinName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextOfKinRelationship => $composableBuilder(
    column: $table.nextOfKinRelationship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextOfKinNIN => $composableBuilder(
    column: $table.nextOfKinNIN,
    builder: (column) => column,
  );

  Expression<T> loansRefs<T extends Object>(
    Expression<T> Function($$LoansTableAnnotationComposer a) f,
  ) {
    final $$LoansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loans,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoansTableAnnotationComposer(
            $db: $db,
            $table: $db.loans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> loanPaymentsRefs<T extends Object>(
    Expression<T> Function($$LoanPaymentsTableAnnotationComposer a) f,
  ) {
    final $$LoanPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loanPayments,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.loanPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> savingsRefs<T extends Object>(
    Expression<T> Function($$SavingsTableAnnotationComposer a) f,
  ) {
    final $$SavingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savings,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsTableAnnotationComposer(
            $db: $db,
            $table: $db.savings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> penaltiesRefs<T extends Object>(
    Expression<T> Function($$PenaltiesTableAnnotationComposer a) f,
  ) {
    final $$PenaltiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.penalties,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenaltiesTableAnnotationComposer(
            $db: $db,
            $table: $db.penalties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> welfaresRefs<T extends Object>(
    Expression<T> Function($$WelfaresTableAnnotationComposer a) f,
  ) {
    final $$WelfaresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.welfares,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WelfaresTableAnnotationComposer(
            $db: $db,
            $table: $db.welfares,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTable,
          Client,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (Client, $$ClientsTableReferences),
          Client,
          PrefetchHooks Function({
            bool loansRefs,
            bool loanPaymentsRefs,
            bool savingsRefs,
            bool penaltiesRefs,
            bool welfaresRefs,
          })
        > {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> idNumber = const Value.absent(),
                Value<String> contact = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> idImagePath = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> nextOfKinName = const Value.absent(),
                Value<String?> nextOfKinRelationship = const Value.absent(),
                Value<String?> nextOfKinNIN = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                clientId: clientId,
                name: name,
                idNumber: idNumber,
                contact: contact,
                address: address,
                date: date,
                idImagePath: idImagePath,
                gender: gender,
                dateOfBirth: dateOfBirth,
                age: age,
                nextOfKinName: nextOfKinName,
                nextOfKinRelationship: nextOfKinRelationship,
                nextOfKinNIN: nextOfKinNIN,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String clientId,
                required String name,
                required String idNumber,
                required String contact,
                required String address,
                required DateTime date,
                required String idImagePath,
                Value<String?> gender = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> nextOfKinName = const Value.absent(),
                Value<String?> nextOfKinRelationship = const Value.absent(),
                Value<String?> nextOfKinNIN = const Value.absent(),
              }) => ClientsCompanion.insert(
                id: id,
                clientId: clientId,
                name: name,
                idNumber: idNumber,
                contact: contact,
                address: address,
                date: date,
                idImagePath: idImagePath,
                gender: gender,
                dateOfBirth: dateOfBirth,
                age: age,
                nextOfKinName: nextOfKinName,
                nextOfKinRelationship: nextOfKinRelationship,
                nextOfKinNIN: nextOfKinNIN,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                loansRefs = false,
                loanPaymentsRefs = false,
                savingsRefs = false,
                penaltiesRefs = false,
                welfaresRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (loansRefs) db.loans,
                    if (loanPaymentsRefs) db.loanPayments,
                    if (savingsRefs) db.savings,
                    if (penaltiesRefs) db.penalties,
                    if (welfaresRefs) db.welfares,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (loansRefs)
                        await $_getPrefetchedData<Client, $ClientsTable, Loan>(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._loansRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(db, table, p0).loansRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (loanPaymentsRefs)
                        await $_getPrefetchedData<
                          Client,
                          $ClientsTable,
                          LoanPayment
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._loanPaymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).loanPaymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (savingsRefs)
                        await $_getPrefetchedData<
                          Client,
                          $ClientsTable,
                          Saving
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._savingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).savingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (penaltiesRefs)
                        await $_getPrefetchedData<
                          Client,
                          $ClientsTable,
                          Penalty
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._penaltiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).penaltiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (welfaresRefs)
                        await $_getPrefetchedData<
                          Client,
                          $ClientsTable,
                          Welfare
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._welfaresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).welfaresRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTable,
      Client,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (Client, $$ClientsTableReferences),
      Client,
      PrefetchHooks Function({
        bool loansRefs,
        bool loanPaymentsRefs,
        bool savingsRefs,
        bool penaltiesRefs,
        bool welfaresRefs,
      })
    >;
typedef $$LoansTableCreateCompanionBuilder =
    LoansCompanion Function({
      Value<int> id,
      required int clientId,
      required double amount,
      required DateTime issuedDate,
      required double interest,
      required double totalToPay,
      Value<DateTime?> repaymentDate,
      Value<String?> interestType,
      Value<String?> guarantor1Name,
      Value<String?> guarantor1NIN,
      Value<String?> guarantor2Name,
      Value<String?> guarantor2NIN,
      Value<String?> guarantor3Name,
      Value<String?> guarantor3NIN,
    });
typedef $$LoansTableUpdateCompanionBuilder =
    LoansCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<double> amount,
      Value<DateTime> issuedDate,
      Value<double> interest,
      Value<double> totalToPay,
      Value<DateTime?> repaymentDate,
      Value<String?> interestType,
      Value<String?> guarantor1Name,
      Value<String?> guarantor1NIN,
      Value<String?> guarantor2Name,
      Value<String?> guarantor2NIN,
      Value<String?> guarantor3Name,
      Value<String?> guarantor3NIN,
    });

final class $$LoansTableReferences
    extends BaseReferences<_$AppDatabase, $LoansTable, Loan> {
  $$LoansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) => db.clients
      .createAlias($_aliasNameGenerator(db.loans.clientId, db.clients.id));

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoansTableFilterComposer extends Composer<_$AppDatabase, $LoansTable> {
  $$LoansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issuedDate => $composableBuilder(
    column: $table.issuedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get interest => $composableBuilder(
    column: $table.interest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get repaymentDate => $composableBuilder(
    column: $table.repaymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interestType => $composableBuilder(
    column: $table.interestType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor1Name => $composableBuilder(
    column: $table.guarantor1Name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor1NIN => $composableBuilder(
    column: $table.guarantor1NIN,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor2Name => $composableBuilder(
    column: $table.guarantor2Name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor2NIN => $composableBuilder(
    column: $table.guarantor2NIN,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor3Name => $composableBuilder(
    column: $table.guarantor3Name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guarantor3NIN => $composableBuilder(
    column: $table.guarantor3NIN,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableOrderingComposer
    extends Composer<_$AppDatabase, $LoansTable> {
  $$LoansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issuedDate => $composableBuilder(
    column: $table.issuedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get interest => $composableBuilder(
    column: $table.interest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get repaymentDate => $composableBuilder(
    column: $table.repaymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interestType => $composableBuilder(
    column: $table.interestType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor1Name => $composableBuilder(
    column: $table.guarantor1Name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor1NIN => $composableBuilder(
    column: $table.guarantor1NIN,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor2Name => $composableBuilder(
    column: $table.guarantor2Name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor2NIN => $composableBuilder(
    column: $table.guarantor2NIN,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor3Name => $composableBuilder(
    column: $table.guarantor3Name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guarantor3NIN => $composableBuilder(
    column: $table.guarantor3NIN,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoansTable> {
  $$LoansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get issuedDate => $composableBuilder(
    column: $table.issuedDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get interest =>
      $composableBuilder(column: $table.interest, builder: (column) => column);

  GeneratedColumn<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get repaymentDate => $composableBuilder(
    column: $table.repaymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get interestType => $composableBuilder(
    column: $table.interestType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor1Name => $composableBuilder(
    column: $table.guarantor1Name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor1NIN => $composableBuilder(
    column: $table.guarantor1NIN,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor2Name => $composableBuilder(
    column: $table.guarantor2Name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor2NIN => $composableBuilder(
    column: $table.guarantor2NIN,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor3Name => $composableBuilder(
    column: $table.guarantor3Name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guarantor3NIN => $composableBuilder(
    column: $table.guarantor3NIN,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoansTable,
          Loan,
          $$LoansTableFilterComposer,
          $$LoansTableOrderingComposer,
          $$LoansTableAnnotationComposer,
          $$LoansTableCreateCompanionBuilder,
          $$LoansTableUpdateCompanionBuilder,
          (Loan, $$LoansTableReferences),
          Loan,
          PrefetchHooks Function({bool clientId})
        > {
  $$LoansTableTableManager(_$AppDatabase db, $LoansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> issuedDate = const Value.absent(),
                Value<double> interest = const Value.absent(),
                Value<double> totalToPay = const Value.absent(),
                Value<DateTime?> repaymentDate = const Value.absent(),
                Value<String?> interestType = const Value.absent(),
                Value<String?> guarantor1Name = const Value.absent(),
                Value<String?> guarantor1NIN = const Value.absent(),
                Value<String?> guarantor2Name = const Value.absent(),
                Value<String?> guarantor2NIN = const Value.absent(),
                Value<String?> guarantor3Name = const Value.absent(),
                Value<String?> guarantor3NIN = const Value.absent(),
              }) => LoansCompanion(
                id: id,
                clientId: clientId,
                amount: amount,
                issuedDate: issuedDate,
                interest: interest,
                totalToPay: totalToPay,
                repaymentDate: repaymentDate,
                interestType: interestType,
                guarantor1Name: guarantor1Name,
                guarantor1NIN: guarantor1NIN,
                guarantor2Name: guarantor2Name,
                guarantor2NIN: guarantor2NIN,
                guarantor3Name: guarantor3Name,
                guarantor3NIN: guarantor3NIN,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required double amount,
                required DateTime issuedDate,
                required double interest,
                required double totalToPay,
                Value<DateTime?> repaymentDate = const Value.absent(),
                Value<String?> interestType = const Value.absent(),
                Value<String?> guarantor1Name = const Value.absent(),
                Value<String?> guarantor1NIN = const Value.absent(),
                Value<String?> guarantor2Name = const Value.absent(),
                Value<String?> guarantor2NIN = const Value.absent(),
                Value<String?> guarantor3Name = const Value.absent(),
                Value<String?> guarantor3NIN = const Value.absent(),
              }) => LoansCompanion.insert(
                id: id,
                clientId: clientId,
                amount: amount,
                issuedDate: issuedDate,
                interest: interest,
                totalToPay: totalToPay,
                repaymentDate: repaymentDate,
                interestType: interestType,
                guarantor1Name: guarantor1Name,
                guarantor1NIN: guarantor1NIN,
                guarantor2Name: guarantor2Name,
                guarantor2NIN: guarantor2NIN,
                guarantor3Name: guarantor3Name,
                guarantor3NIN: guarantor3NIN,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LoansTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable: $$LoansTableReferences
                                    ._clientIdTable(db),
                                referencedColumn: $$LoansTableReferences
                                    ._clientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoansTable,
      Loan,
      $$LoansTableFilterComposer,
      $$LoansTableOrderingComposer,
      $$LoansTableAnnotationComposer,
      $$LoansTableCreateCompanionBuilder,
      $$LoansTableUpdateCompanionBuilder,
      (Loan, $$LoansTableReferences),
      Loan,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$LoanPaymentsTableCreateCompanionBuilder =
    LoanPaymentsCompanion Function({
      Value<int> id,
      required int clientId,
      required DateTime paymentDate,
      required String paymentNo,
      required double totalToPay,
      required double amount,
      required double remainingBalance,
    });
typedef $$LoanPaymentsTableUpdateCompanionBuilder =
    LoanPaymentsCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<DateTime> paymentDate,
      Value<String> paymentNo,
      Value<double> totalToPay,
      Value<double> amount,
      Value<double> remainingBalance,
    });

final class $$LoanPaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $LoanPaymentsTable, LoanPayment> {
  $$LoanPaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias(
        $_aliasNameGenerator(db.loanPayments.clientId, db.clients.id),
      );

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoanPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $LoanPaymentsTable> {
  $$LoanPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentNo => $composableBuilder(
    column: $table.paymentNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get remainingBalance => $composableBuilder(
    column: $table.remainingBalance,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $LoanPaymentsTable> {
  $$LoanPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentNo => $composableBuilder(
    column: $table.paymentNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get remainingBalance => $composableBuilder(
    column: $table.remainingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoanPaymentsTable> {
  $$LoanPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentNo =>
      $composableBuilder(column: $table.paymentNo, builder: (column) => column);

  GeneratedColumn<double> get totalToPay => $composableBuilder(
    column: $table.totalToPay,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get remainingBalance => $composableBuilder(
    column: $table.remainingBalance,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoanPaymentsTable,
          LoanPayment,
          $$LoanPaymentsTableFilterComposer,
          $$LoanPaymentsTableOrderingComposer,
          $$LoanPaymentsTableAnnotationComposer,
          $$LoanPaymentsTableCreateCompanionBuilder,
          $$LoanPaymentsTableUpdateCompanionBuilder,
          (LoanPayment, $$LoanPaymentsTableReferences),
          LoanPayment,
          PrefetchHooks Function({bool clientId})
        > {
  $$LoanPaymentsTableTableManager(_$AppDatabase db, $LoanPaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoanPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoanPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoanPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String> paymentNo = const Value.absent(),
                Value<double> totalToPay = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<double> remainingBalance = const Value.absent(),
              }) => LoanPaymentsCompanion(
                id: id,
                clientId: clientId,
                paymentDate: paymentDate,
                paymentNo: paymentNo,
                totalToPay: totalToPay,
                amount: amount,
                remainingBalance: remainingBalance,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required DateTime paymentDate,
                required String paymentNo,
                required double totalToPay,
                required double amount,
                required double remainingBalance,
              }) => LoanPaymentsCompanion.insert(
                id: id,
                clientId: clientId,
                paymentDate: paymentDate,
                paymentNo: paymentNo,
                totalToPay: totalToPay,
                amount: amount,
                remainingBalance: remainingBalance,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoanPaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable: $$LoanPaymentsTableReferences
                                    ._clientIdTable(db),
                                referencedColumn: $$LoanPaymentsTableReferences
                                    ._clientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoanPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoanPaymentsTable,
      LoanPayment,
      $$LoanPaymentsTableFilterComposer,
      $$LoanPaymentsTableOrderingComposer,
      $$LoanPaymentsTableAnnotationComposer,
      $$LoanPaymentsTableCreateCompanionBuilder,
      $$LoanPaymentsTableUpdateCompanionBuilder,
      (LoanPayment, $$LoanPaymentsTableReferences),
      LoanPayment,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$SavingsTableCreateCompanionBuilder =
    SavingsCompanion Function({
      Value<int> id,
      required int clientId,
      required String savingNo,
      required double amount,
      required DateTime savingDate,
    });
typedef $$SavingsTableUpdateCompanionBuilder =
    SavingsCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<String> savingNo,
      Value<double> amount,
      Value<DateTime> savingDate,
    });

final class $$SavingsTableReferences
    extends BaseReferences<_$AppDatabase, $SavingsTable, Saving> {
  $$SavingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) => db.clients
      .createAlias($_aliasNameGenerator(db.savings.clientId, db.clients.id));

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SavingsTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsTable> {
  $$SavingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savingNo => $composableBuilder(
    column: $table.savingNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get savingDate => $composableBuilder(
    column: $table.savingDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsTable> {
  $$SavingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savingNo => $composableBuilder(
    column: $table.savingNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get savingDate => $composableBuilder(
    column: $table.savingDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsTable> {
  $$SavingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get savingNo =>
      $composableBuilder(column: $table.savingNo, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get savingDate => $composableBuilder(
    column: $table.savingDate,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsTable,
          Saving,
          $$SavingsTableFilterComposer,
          $$SavingsTableOrderingComposer,
          $$SavingsTableAnnotationComposer,
          $$SavingsTableCreateCompanionBuilder,
          $$SavingsTableUpdateCompanionBuilder,
          (Saving, $$SavingsTableReferences),
          Saving,
          PrefetchHooks Function({bool clientId})
        > {
  $$SavingsTableTableManager(_$AppDatabase db, $SavingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<String> savingNo = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> savingDate = const Value.absent(),
              }) => SavingsCompanion(
                id: id,
                clientId: clientId,
                savingNo: savingNo,
                amount: amount,
                savingDate: savingDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required String savingNo,
                required double amount,
                required DateTime savingDate,
              }) => SavingsCompanion.insert(
                id: id,
                clientId: clientId,
                savingNo: savingNo,
                amount: amount,
                savingDate: savingDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SavingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable: $$SavingsTableReferences
                                    ._clientIdTable(db),
                                referencedColumn: $$SavingsTableReferences
                                    ._clientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SavingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsTable,
      Saving,
      $$SavingsTableFilterComposer,
      $$SavingsTableOrderingComposer,
      $$SavingsTableAnnotationComposer,
      $$SavingsTableCreateCompanionBuilder,
      $$SavingsTableUpdateCompanionBuilder,
      (Saving, $$SavingsTableReferences),
      Saving,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$PenaltiesTableCreateCompanionBuilder =
    PenaltiesCompanion Function({
      Value<int> id,
      required int clientId,
      required String penaltyNo,
      required double amount,
      required DateTime penaltyDate,
    });
typedef $$PenaltiesTableUpdateCompanionBuilder =
    PenaltiesCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<String> penaltyNo,
      Value<double> amount,
      Value<DateTime> penaltyDate,
    });

final class $$PenaltiesTableReferences
    extends BaseReferences<_$AppDatabase, $PenaltiesTable, Penalty> {
  $$PenaltiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) => db.clients
      .createAlias($_aliasNameGenerator(db.penalties.clientId, db.clients.id));

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PenaltiesTableFilterComposer
    extends Composer<_$AppDatabase, $PenaltiesTable> {
  $$PenaltiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get penaltyNo => $composableBuilder(
    column: $table.penaltyNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get penaltyDate => $composableBuilder(
    column: $table.penaltyDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PenaltiesTableOrderingComposer
    extends Composer<_$AppDatabase, $PenaltiesTable> {
  $$PenaltiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get penaltyNo => $composableBuilder(
    column: $table.penaltyNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get penaltyDate => $composableBuilder(
    column: $table.penaltyDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PenaltiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PenaltiesTable> {
  $$PenaltiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get penaltyNo =>
      $composableBuilder(column: $table.penaltyNo, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get penaltyDate => $composableBuilder(
    column: $table.penaltyDate,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PenaltiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PenaltiesTable,
          Penalty,
          $$PenaltiesTableFilterComposer,
          $$PenaltiesTableOrderingComposer,
          $$PenaltiesTableAnnotationComposer,
          $$PenaltiesTableCreateCompanionBuilder,
          $$PenaltiesTableUpdateCompanionBuilder,
          (Penalty, $$PenaltiesTableReferences),
          Penalty,
          PrefetchHooks Function({bool clientId})
        > {
  $$PenaltiesTableTableManager(_$AppDatabase db, $PenaltiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PenaltiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PenaltiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PenaltiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<String> penaltyNo = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> penaltyDate = const Value.absent(),
              }) => PenaltiesCompanion(
                id: id,
                clientId: clientId,
                penaltyNo: penaltyNo,
                amount: amount,
                penaltyDate: penaltyDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required String penaltyNo,
                required double amount,
                required DateTime penaltyDate,
              }) => PenaltiesCompanion.insert(
                id: id,
                clientId: clientId,
                penaltyNo: penaltyNo,
                amount: amount,
                penaltyDate: penaltyDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PenaltiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable: $$PenaltiesTableReferences
                                    ._clientIdTable(db),
                                referencedColumn: $$PenaltiesTableReferences
                                    ._clientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PenaltiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PenaltiesTable,
      Penalty,
      $$PenaltiesTableFilterComposer,
      $$PenaltiesTableOrderingComposer,
      $$PenaltiesTableAnnotationComposer,
      $$PenaltiesTableCreateCompanionBuilder,
      $$PenaltiesTableUpdateCompanionBuilder,
      (Penalty, $$PenaltiesTableReferences),
      Penalty,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$WelfaresTableCreateCompanionBuilder =
    WelfaresCompanion Function({
      Value<int> id,
      required int clientId,
      required String welfareNo,
      required double amount,
      required DateTime date,
    });
typedef $$WelfaresTableUpdateCompanionBuilder =
    WelfaresCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<String> welfareNo,
      Value<double> amount,
      Value<DateTime> date,
    });

final class $$WelfaresTableReferences
    extends BaseReferences<_$AppDatabase, $WelfaresTable, Welfare> {
  $$WelfaresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) => db.clients
      .createAlias($_aliasNameGenerator(db.welfares.clientId, db.clients.id));

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WelfaresTableFilterComposer
    extends Composer<_$AppDatabase, $WelfaresTable> {
  $$WelfaresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get welfareNo => $composableBuilder(
    column: $table.welfareNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WelfaresTableOrderingComposer
    extends Composer<_$AppDatabase, $WelfaresTable> {
  $$WelfaresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get welfareNo => $composableBuilder(
    column: $table.welfareNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WelfaresTableAnnotationComposer
    extends Composer<_$AppDatabase, $WelfaresTable> {
  $$WelfaresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get welfareNo =>
      $composableBuilder(column: $table.welfareNo, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WelfaresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WelfaresTable,
          Welfare,
          $$WelfaresTableFilterComposer,
          $$WelfaresTableOrderingComposer,
          $$WelfaresTableAnnotationComposer,
          $$WelfaresTableCreateCompanionBuilder,
          $$WelfaresTableUpdateCompanionBuilder,
          (Welfare, $$WelfaresTableReferences),
          Welfare,
          PrefetchHooks Function({bool clientId})
        > {
  $$WelfaresTableTableManager(_$AppDatabase db, $WelfaresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WelfaresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WelfaresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WelfaresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<String> welfareNo = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => WelfaresCompanion(
                id: id,
                clientId: clientId,
                welfareNo: welfareNo,
                amount: amount,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required String welfareNo,
                required double amount,
                required DateTime date,
              }) => WelfaresCompanion.insert(
                id: id,
                clientId: clientId,
                welfareNo: welfareNo,
                amount: amount,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WelfaresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable: $$WelfaresTableReferences
                                    ._clientIdTable(db),
                                referencedColumn: $$WelfaresTableReferences
                                    ._clientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WelfaresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WelfaresTable,
      Welfare,
      $$WelfaresTableFilterComposer,
      $$WelfaresTableOrderingComposer,
      $$WelfaresTableAnnotationComposer,
      $$WelfaresTableCreateCompanionBuilder,
      $$WelfaresTableUpdateCompanionBuilder,
      (Welfare, $$WelfaresTableReferences),
      Welfare,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$SubscriptionsTableCreateCompanionBuilder =
    SubscriptionsCompanion Function({
      Value<int> id,
      required DateTime date,
      required double amount,
    });
typedef $$SubscriptionsTableUpdateCompanionBuilder =
    SubscriptionsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> amount,
    });

class $$SubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$SubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscriptionsTable,
          Subscription,
          $$SubscriptionsTableFilterComposer,
          $$SubscriptionsTableOrderingComposer,
          $$SubscriptionsTableAnnotationComposer,
          $$SubscriptionsTableCreateCompanionBuilder,
          $$SubscriptionsTableUpdateCompanionBuilder,
          (
            Subscription,
            BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription>,
          ),
          Subscription,
          PrefetchHooks Function()
        > {
  $$SubscriptionsTableTableManager(_$AppDatabase db, $SubscriptionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => SubscriptionsCompanion(id: id, date: date, amount: amount),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double amount,
              }) => SubscriptionsCompanion.insert(
                id: id,
                date: date,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscriptionsTable,
      Subscription,
      $$SubscriptionsTableFilterComposer,
      $$SubscriptionsTableOrderingComposer,
      $$SubscriptionsTableAnnotationComposer,
      $$SubscriptionsTableCreateCompanionBuilder,
      $$SubscriptionsTableUpdateCompanionBuilder,
      (
        Subscription,
        BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription>,
      ),
      Subscription,
      PrefetchHooks Function()
    >;
typedef $$InterestIncomeTableCreateCompanionBuilder =
    InterestIncomeCompanion Function({
      Value<int> id,
      required DateTime date,
      required double amount,
    });
typedef $$InterestIncomeTableUpdateCompanionBuilder =
    InterestIncomeCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> amount,
    });

class $$InterestIncomeTableFilterComposer
    extends Composer<_$AppDatabase, $InterestIncomeTable> {
  $$InterestIncomeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InterestIncomeTableOrderingComposer
    extends Composer<_$AppDatabase, $InterestIncomeTable> {
  $$InterestIncomeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InterestIncomeTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterestIncomeTable> {
  $$InterestIncomeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$InterestIncomeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterestIncomeTable,
          InterestIncomeData,
          $$InterestIncomeTableFilterComposer,
          $$InterestIncomeTableOrderingComposer,
          $$InterestIncomeTableAnnotationComposer,
          $$InterestIncomeTableCreateCompanionBuilder,
          $$InterestIncomeTableUpdateCompanionBuilder,
          (
            InterestIncomeData,
            BaseReferences<
              _$AppDatabase,
              $InterestIncomeTable,
              InterestIncomeData
            >,
          ),
          InterestIncomeData,
          PrefetchHooks Function()
        > {
  $$InterestIncomeTableTableManager(
    _$AppDatabase db,
    $InterestIncomeTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterestIncomeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterestIncomeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InterestIncomeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => InterestIncomeCompanion(id: id, date: date, amount: amount),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double amount,
              }) => InterestIncomeCompanion.insert(
                id: id,
                date: date,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InterestIncomeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterestIncomeTable,
      InterestIncomeData,
      $$InterestIncomeTableFilterComposer,
      $$InterestIncomeTableOrderingComposer,
      $$InterestIncomeTableAnnotationComposer,
      $$InterestIncomeTableCreateCompanionBuilder,
      $$InterestIncomeTableUpdateCompanionBuilder,
      (
        InterestIncomeData,
        BaseReferences<_$AppDatabase, $InterestIncomeTable, InterestIncomeData>,
      ),
      InterestIncomeData,
      PrefetchHooks Function()
    >;
typedef $$InvestmentsTableCreateCompanionBuilder =
    InvestmentsCompanion Function({
      Value<int> id,
      required DateTime date,
      required double amount,
    });
typedef $$InvestmentsTableUpdateCompanionBuilder =
    InvestmentsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> amount,
    });

class $$InvestmentsTableFilterComposer
    extends Composer<_$AppDatabase, $InvestmentsTable> {
  $$InvestmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvestmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvestmentsTable> {
  $$InvestmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvestmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvestmentsTable> {
  $$InvestmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$InvestmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvestmentsTable,
          Investment,
          $$InvestmentsTableFilterComposer,
          $$InvestmentsTableOrderingComposer,
          $$InvestmentsTableAnnotationComposer,
          $$InvestmentsTableCreateCompanionBuilder,
          $$InvestmentsTableUpdateCompanionBuilder,
          (
            Investment,
            BaseReferences<_$AppDatabase, $InvestmentsTable, Investment>,
          ),
          Investment,
          PrefetchHooks Function()
        > {
  $$InvestmentsTableTableManager(_$AppDatabase db, $InvestmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvestmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvestmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvestmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => InvestmentsCompanion(id: id, date: date, amount: amount),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double amount,
              }) => InvestmentsCompanion.insert(
                id: id,
                date: date,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InvestmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvestmentsTable,
      Investment,
      $$InvestmentsTableFilterComposer,
      $$InvestmentsTableOrderingComposer,
      $$InvestmentsTableAnnotationComposer,
      $$InvestmentsTableCreateCompanionBuilder,
      $$InvestmentsTableUpdateCompanionBuilder,
      (
        Investment,
        BaseReferences<_$AppDatabase, $InvestmentsTable, Investment>,
      ),
      Investment,
      PrefetchHooks Function()
    >;
typedef $$CostsTableCreateCompanionBuilder =
    CostsCompanion Function({
      Value<int> id,
      required DateTime date,
      required String type,
      required String purpose,
      required double amount,
    });
typedef $$CostsTableUpdateCompanionBuilder =
    CostsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> type,
      Value<String> purpose,
      Value<double> amount,
    });

class $$CostsTableFilterComposer extends Composer<_$AppDatabase, $CostsTable> {
  $$CostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CostsTableOrderingComposer
    extends Composer<_$AppDatabase, $CostsTable> {
  $$CostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CostsTable> {
  $$CostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$CostsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CostsTable,
          Cost,
          $$CostsTableFilterComposer,
          $$CostsTableOrderingComposer,
          $$CostsTableAnnotationComposer,
          $$CostsTableCreateCompanionBuilder,
          $$CostsTableUpdateCompanionBuilder,
          (Cost, BaseReferences<_$AppDatabase, $CostsTable, Cost>),
          Cost,
          PrefetchHooks Function()
        > {
  $$CostsTableTableManager(_$AppDatabase db, $CostsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> purpose = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => CostsCompanion(
                id: id,
                date: date,
                type: type,
                purpose: purpose,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String type,
                required String purpose,
                required double amount,
              }) => CostsCompanion.insert(
                id: id,
                date: date,
                type: type,
                purpose: purpose,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CostsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CostsTable,
      Cost,
      $$CostsTableFilterComposer,
      $$CostsTableOrderingComposer,
      $$CostsTableAnnotationComposer,
      $$CostsTableCreateCompanionBuilder,
      $$CostsTableUpdateCompanionBuilder,
      (Cost, BaseReferences<_$AppDatabase, $CostsTable, Cost>),
      Cost,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$LoansTableTableManager get loans =>
      $$LoansTableTableManager(_db, _db.loans);
  $$LoanPaymentsTableTableManager get loanPayments =>
      $$LoanPaymentsTableTableManager(_db, _db.loanPayments);
  $$SavingsTableTableManager get savings =>
      $$SavingsTableTableManager(_db, _db.savings);
  $$PenaltiesTableTableManager get penalties =>
      $$PenaltiesTableTableManager(_db, _db.penalties);
  $$WelfaresTableTableManager get welfares =>
      $$WelfaresTableTableManager(_db, _db.welfares);
  $$SubscriptionsTableTableManager get subscriptions =>
      $$SubscriptionsTableTableManager(_db, _db.subscriptions);
  $$InterestIncomeTableTableManager get interestIncome =>
      $$InterestIncomeTableTableManager(_db, _db.interestIncome);
  $$InvestmentsTableTableManager get investments =>
      $$InvestmentsTableTableManager(_db, _db.investments);
  $$CostsTableTableManager get costs =>
      $$CostsTableTableManager(_db, _db.costs);
}
