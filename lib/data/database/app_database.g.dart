// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DutiesTable extends Duties with TableInfo<$DutiesTable, Duty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DutiesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
    'place',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startKmMeta = const VerificationMeta(
    'startKm',
  );
  @override
  late final GeneratedColumn<int> startKm = GeneratedColumn<int>(
    'start_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endKmMeta = const VerificationMeta('endKm');
  @override
  late final GeneratedColumn<int> endKm = GeneratedColumn<int>(
    'end_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalKmMeta = const VerificationMeta(
    'totalKm',
  );
  @override
  late final GeneratedColumn<int> totalKm = GeneratedColumn<int>(
    'total_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AcType, String> acType =
      GeneratedColumn<String>(
        'ac_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AcType>($DutiesTable.$converteracType);
  static const VerificationMeta _rentMeta = const VerificationMeta('rent');
  @override
  late final GeneratedColumn<int> rent = GeneratedColumn<int>(
    'rent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fuelCostMeta = const VerificationMeta(
    'fuelCost',
  );
  @override
  late final GeneratedColumn<int> fuelCost = GeneratedColumn<int>(
    'fuel_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parkingMeta = const VerificationMeta(
    'parking',
  );
  @override
  late final GeneratedColumn<int> parking = GeneratedColumn<int>(
    'parking',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tollMeta = const VerificationMeta('toll');
  @override
  late final GeneratedColumn<int> toll = GeneratedColumn<int>(
    'toll',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _serviceMeta = const VerificationMeta(
    'service',
  );
  @override
  late final GeneratedColumn<int> service = GeneratedColumn<int>(
    'service',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tyreMeta = const VerificationMeta('tyre');
  @override
  late final GeneratedColumn<int> tyre = GeneratedColumn<int>(
    'tyre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _insuranceMeta = const VerificationMeta(
    'insurance',
  );
  @override
  late final GeneratedColumn<int> insurance = GeneratedColumn<int>(
    'insurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _engineOilMeta = const VerificationMeta(
    'engineOil',
  );
  @override
  late final GeneratedColumn<int> engineOil = GeneratedColumn<int>(
    'engine_oil',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    place,
    startKm,
    endKm,
    totalKm,
    acType,
    rent,
    fuelCost,
    parking,
    toll,
    service,
    tyre,
    insurance,
    engineOil,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'duties';
  @override
  VerificationContext validateIntegrity(
    Insertable<Duty> instance, {
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
    if (data.containsKey('place')) {
      context.handle(
        _placeMeta,
        place.isAcceptableOrUnknown(data['place']!, _placeMeta),
      );
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('start_km')) {
      context.handle(
        _startKmMeta,
        startKm.isAcceptableOrUnknown(data['start_km']!, _startKmMeta),
      );
    } else if (isInserting) {
      context.missing(_startKmMeta);
    }
    if (data.containsKey('end_km')) {
      context.handle(
        _endKmMeta,
        endKm.isAcceptableOrUnknown(data['end_km']!, _endKmMeta),
      );
    } else if (isInserting) {
      context.missing(_endKmMeta);
    }
    if (data.containsKey('total_km')) {
      context.handle(
        _totalKmMeta,
        totalKm.isAcceptableOrUnknown(data['total_km']!, _totalKmMeta),
      );
    } else if (isInserting) {
      context.missing(_totalKmMeta);
    }
    if (data.containsKey('rent')) {
      context.handle(
        _rentMeta,
        rent.isAcceptableOrUnknown(data['rent']!, _rentMeta),
      );
    } else if (isInserting) {
      context.missing(_rentMeta);
    }
    if (data.containsKey('fuel_cost')) {
      context.handle(
        _fuelCostMeta,
        fuelCost.isAcceptableOrUnknown(data['fuel_cost']!, _fuelCostMeta),
      );
    } else if (isInserting) {
      context.missing(_fuelCostMeta);
    }
    if (data.containsKey('parking')) {
      context.handle(
        _parkingMeta,
        parking.isAcceptableOrUnknown(data['parking']!, _parkingMeta),
      );
    }
    if (data.containsKey('toll')) {
      context.handle(
        _tollMeta,
        toll.isAcceptableOrUnknown(data['toll']!, _tollMeta),
      );
    }
    if (data.containsKey('service')) {
      context.handle(
        _serviceMeta,
        service.isAcceptableOrUnknown(data['service']!, _serviceMeta),
      );
    }
    if (data.containsKey('tyre')) {
      context.handle(
        _tyreMeta,
        tyre.isAcceptableOrUnknown(data['tyre']!, _tyreMeta),
      );
    }
    if (data.containsKey('insurance')) {
      context.handle(
        _insuranceMeta,
        insurance.isAcceptableOrUnknown(data['insurance']!, _insuranceMeta),
      );
    }
    if (data.containsKey('engine_oil')) {
      context.handle(
        _engineOilMeta,
        engineOil.isAcceptableOrUnknown(data['engine_oil']!, _engineOilMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Duty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Duty(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      place: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place'],
      )!,
      startKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_km'],
      )!,
      endKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_km'],
      )!,
      totalKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_km'],
      )!,
      acType: $DutiesTable.$converteracType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ac_type'],
        )!,
      ),
      rent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rent'],
      )!,
      fuelCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fuel_cost'],
      )!,
      parking: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parking'],
      )!,
      toll: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}toll'],
      )!,
      service: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}service'],
      )!,
      tyre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tyre'],
      )!,
      insurance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}insurance'],
      )!,
      engineOil: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}engine_oil'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DutiesTable createAlias(String alias) {
    return $DutiesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AcType, String, String> $converteracType =
      const EnumNameConverter<AcType>(AcType.values);
}

class Duty extends DataClass implements Insertable<Duty> {
  final int id;
  final DateTime date;
  final String place;
  final int startKm;
  final int endKm;
  final int totalKm;
  final AcType acType;
  final int rent;
  final int fuelCost;
  final int parking;
  final int toll;
  final int service;
  final int tyre;
  final int insurance;
  final int engineOil;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Duty({
    required this.id,
    required this.date,
    required this.place,
    required this.startKm,
    required this.endKm,
    required this.totalKm,
    required this.acType,
    required this.rent,
    required this.fuelCost,
    required this.parking,
    required this.toll,
    required this.service,
    required this.tyre,
    required this.insurance,
    required this.engineOil,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['place'] = Variable<String>(place);
    map['start_km'] = Variable<int>(startKm);
    map['end_km'] = Variable<int>(endKm);
    map['total_km'] = Variable<int>(totalKm);
    {
      map['ac_type'] = Variable<String>(
        $DutiesTable.$converteracType.toSql(acType),
      );
    }
    map['rent'] = Variable<int>(rent);
    map['fuel_cost'] = Variable<int>(fuelCost);
    map['parking'] = Variable<int>(parking);
    map['toll'] = Variable<int>(toll);
    map['service'] = Variable<int>(service);
    map['tyre'] = Variable<int>(tyre);
    map['insurance'] = Variable<int>(insurance);
    map['engine_oil'] = Variable<int>(engineOil);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DutiesCompanion toCompanion(bool nullToAbsent) {
    return DutiesCompanion(
      id: Value(id),
      date: Value(date),
      place: Value(place),
      startKm: Value(startKm),
      endKm: Value(endKm),
      totalKm: Value(totalKm),
      acType: Value(acType),
      rent: Value(rent),
      fuelCost: Value(fuelCost),
      parking: Value(parking),
      toll: Value(toll),
      service: Value(service),
      tyre: Value(tyre),
      insurance: Value(insurance),
      engineOil: Value(engineOil),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Duty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Duty(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      place: serializer.fromJson<String>(json['place']),
      startKm: serializer.fromJson<int>(json['startKm']),
      endKm: serializer.fromJson<int>(json['endKm']),
      totalKm: serializer.fromJson<int>(json['totalKm']),
      acType: $DutiesTable.$converteracType.fromJson(
        serializer.fromJson<String>(json['acType']),
      ),
      rent: serializer.fromJson<int>(json['rent']),
      fuelCost: serializer.fromJson<int>(json['fuelCost']),
      parking: serializer.fromJson<int>(json['parking']),
      toll: serializer.fromJson<int>(json['toll']),
      service: serializer.fromJson<int>(json['service']),
      tyre: serializer.fromJson<int>(json['tyre']),
      insurance: serializer.fromJson<int>(json['insurance']),
      engineOil: serializer.fromJson<int>(json['engineOil']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'place': serializer.toJson<String>(place),
      'startKm': serializer.toJson<int>(startKm),
      'endKm': serializer.toJson<int>(endKm),
      'totalKm': serializer.toJson<int>(totalKm),
      'acType': serializer.toJson<String>(
        $DutiesTable.$converteracType.toJson(acType),
      ),
      'rent': serializer.toJson<int>(rent),
      'fuelCost': serializer.toJson<int>(fuelCost),
      'parking': serializer.toJson<int>(parking),
      'toll': serializer.toJson<int>(toll),
      'service': serializer.toJson<int>(service),
      'tyre': serializer.toJson<int>(tyre),
      'insurance': serializer.toJson<int>(insurance),
      'engineOil': serializer.toJson<int>(engineOil),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Duty copyWith({
    int? id,
    DateTime? date,
    String? place,
    int? startKm,
    int? endKm,
    int? totalKm,
    AcType? acType,
    int? rent,
    int? fuelCost,
    int? parking,
    int? toll,
    int? service,
    int? tyre,
    int? insurance,
    int? engineOil,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Duty(
    id: id ?? this.id,
    date: date ?? this.date,
    place: place ?? this.place,
    startKm: startKm ?? this.startKm,
    endKm: endKm ?? this.endKm,
    totalKm: totalKm ?? this.totalKm,
    acType: acType ?? this.acType,
    rent: rent ?? this.rent,
    fuelCost: fuelCost ?? this.fuelCost,
    parking: parking ?? this.parking,
    toll: toll ?? this.toll,
    service: service ?? this.service,
    tyre: tyre ?? this.tyre,
    insurance: insurance ?? this.insurance,
    engineOil: engineOil ?? this.engineOil,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Duty copyWithCompanion(DutiesCompanion data) {
    return Duty(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      place: data.place.present ? data.place.value : this.place,
      startKm: data.startKm.present ? data.startKm.value : this.startKm,
      endKm: data.endKm.present ? data.endKm.value : this.endKm,
      totalKm: data.totalKm.present ? data.totalKm.value : this.totalKm,
      acType: data.acType.present ? data.acType.value : this.acType,
      rent: data.rent.present ? data.rent.value : this.rent,
      fuelCost: data.fuelCost.present ? data.fuelCost.value : this.fuelCost,
      parking: data.parking.present ? data.parking.value : this.parking,
      toll: data.toll.present ? data.toll.value : this.toll,
      service: data.service.present ? data.service.value : this.service,
      tyre: data.tyre.present ? data.tyre.value : this.tyre,
      insurance: data.insurance.present ? data.insurance.value : this.insurance,
      engineOil: data.engineOil.present ? data.engineOil.value : this.engineOil,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Duty(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('place: $place, ')
          ..write('startKm: $startKm, ')
          ..write('endKm: $endKm, ')
          ..write('totalKm: $totalKm, ')
          ..write('acType: $acType, ')
          ..write('rent: $rent, ')
          ..write('fuelCost: $fuelCost, ')
          ..write('parking: $parking, ')
          ..write('toll: $toll, ')
          ..write('service: $service, ')
          ..write('tyre: $tyre, ')
          ..write('insurance: $insurance, ')
          ..write('engineOil: $engineOil, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    place,
    startKm,
    endKm,
    totalKm,
    acType,
    rent,
    fuelCost,
    parking,
    toll,
    service,
    tyre,
    insurance,
    engineOil,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Duty &&
          other.id == this.id &&
          other.date == this.date &&
          other.place == this.place &&
          other.startKm == this.startKm &&
          other.endKm == this.endKm &&
          other.totalKm == this.totalKm &&
          other.acType == this.acType &&
          other.rent == this.rent &&
          other.fuelCost == this.fuelCost &&
          other.parking == this.parking &&
          other.toll == this.toll &&
          other.service == this.service &&
          other.tyre == this.tyre &&
          other.insurance == this.insurance &&
          other.engineOil == this.engineOil &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DutiesCompanion extends UpdateCompanion<Duty> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> place;
  final Value<int> startKm;
  final Value<int> endKm;
  final Value<int> totalKm;
  final Value<AcType> acType;
  final Value<int> rent;
  final Value<int> fuelCost;
  final Value<int> parking;
  final Value<int> toll;
  final Value<int> service;
  final Value<int> tyre;
  final Value<int> insurance;
  final Value<int> engineOil;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DutiesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.place = const Value.absent(),
    this.startKm = const Value.absent(),
    this.endKm = const Value.absent(),
    this.totalKm = const Value.absent(),
    this.acType = const Value.absent(),
    this.rent = const Value.absent(),
    this.fuelCost = const Value.absent(),
    this.parking = const Value.absent(),
    this.toll = const Value.absent(),
    this.service = const Value.absent(),
    this.tyre = const Value.absent(),
    this.insurance = const Value.absent(),
    this.engineOil = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DutiesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String place,
    required int startKm,
    required int endKm,
    required int totalKm,
    required AcType acType,
    required int rent,
    required int fuelCost,
    this.parking = const Value.absent(),
    this.toll = const Value.absent(),
    this.service = const Value.absent(),
    this.tyre = const Value.absent(),
    this.insurance = const Value.absent(),
    this.engineOil = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : date = Value(date),
       place = Value(place),
       startKm = Value(startKm),
       endKm = Value(endKm),
       totalKm = Value(totalKm),
       acType = Value(acType),
       rent = Value(rent),
       fuelCost = Value(fuelCost);
  static Insertable<Duty> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? place,
    Expression<int>? startKm,
    Expression<int>? endKm,
    Expression<int>? totalKm,
    Expression<String>? acType,
    Expression<int>? rent,
    Expression<int>? fuelCost,
    Expression<int>? parking,
    Expression<int>? toll,
    Expression<int>? service,
    Expression<int>? tyre,
    Expression<int>? insurance,
    Expression<int>? engineOil,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (place != null) 'place': place,
      if (startKm != null) 'start_km': startKm,
      if (endKm != null) 'end_km': endKm,
      if (totalKm != null) 'total_km': totalKm,
      if (acType != null) 'ac_type': acType,
      if (rent != null) 'rent': rent,
      if (fuelCost != null) 'fuel_cost': fuelCost,
      if (parking != null) 'parking': parking,
      if (toll != null) 'toll': toll,
      if (service != null) 'service': service,
      if (tyre != null) 'tyre': tyre,
      if (insurance != null) 'insurance': insurance,
      if (engineOil != null) 'engine_oil': engineOil,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DutiesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? place,
    Value<int>? startKm,
    Value<int>? endKm,
    Value<int>? totalKm,
    Value<AcType>? acType,
    Value<int>? rent,
    Value<int>? fuelCost,
    Value<int>? parking,
    Value<int>? toll,
    Value<int>? service,
    Value<int>? tyre,
    Value<int>? insurance,
    Value<int>? engineOil,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DutiesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      place: place ?? this.place,
      startKm: startKm ?? this.startKm,
      endKm: endKm ?? this.endKm,
      totalKm: totalKm ?? this.totalKm,
      acType: acType ?? this.acType,
      rent: rent ?? this.rent,
      fuelCost: fuelCost ?? this.fuelCost,
      parking: parking ?? this.parking,
      toll: toll ?? this.toll,
      service: service ?? this.service,
      tyre: tyre ?? this.tyre,
      insurance: insurance ?? this.insurance,
      engineOil: engineOil ?? this.engineOil,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    if (startKm.present) {
      map['start_km'] = Variable<int>(startKm.value);
    }
    if (endKm.present) {
      map['end_km'] = Variable<int>(endKm.value);
    }
    if (totalKm.present) {
      map['total_km'] = Variable<int>(totalKm.value);
    }
    if (acType.present) {
      map['ac_type'] = Variable<String>(
        $DutiesTable.$converteracType.toSql(acType.value),
      );
    }
    if (rent.present) {
      map['rent'] = Variable<int>(rent.value);
    }
    if (fuelCost.present) {
      map['fuel_cost'] = Variable<int>(fuelCost.value);
    }
    if (parking.present) {
      map['parking'] = Variable<int>(parking.value);
    }
    if (toll.present) {
      map['toll'] = Variable<int>(toll.value);
    }
    if (service.present) {
      map['service'] = Variable<int>(service.value);
    }
    if (tyre.present) {
      map['tyre'] = Variable<int>(tyre.value);
    }
    if (insurance.present) {
      map['insurance'] = Variable<int>(insurance.value);
    }
    if (engineOil.present) {
      map['engine_oil'] = Variable<int>(engineOil.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DutiesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('place: $place, ')
          ..write('startKm: $startKm, ')
          ..write('endKm: $endKm, ')
          ..write('totalKm: $totalKm, ')
          ..write('acType: $acType, ')
          ..write('rent: $rent, ')
          ..write('fuelCost: $fuelCost, ')
          ..write('parking: $parking, ')
          ..write('toll: $toll, ')
          ..write('service: $service, ')
          ..write('tyre: $tyre, ')
          ..write('insurance: $insurance, ')
          ..write('engineOil: $engineOil, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CustomExpensesTable extends CustomExpenses
    with TableInfo<$CustomExpensesTable, CustomExpense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomExpensesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dutyIdMeta = const VerificationMeta('dutyId');
  @override
  late final GeneratedColumn<int> dutyId = GeneratedColumn<int>(
    'duty_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES duties (id) ON DELETE CASCADE',
    ),
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
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dutyId, name, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomExpense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('duty_id')) {
      context.handle(
        _dutyIdMeta,
        dutyId.isAcceptableOrUnknown(data['duty_id']!, _dutyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dutyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  CustomExpense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomExpense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dutyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duty_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $CustomExpensesTable createAlias(String alias) {
    return $CustomExpensesTable(attachedDatabase, alias);
  }
}

class CustomExpense extends DataClass implements Insertable<CustomExpense> {
  final int id;
  final int dutyId;
  final String name;
  final int amount;
  const CustomExpense({
    required this.id,
    required this.dutyId,
    required this.name,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['duty_id'] = Variable<int>(dutyId);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  CustomExpensesCompanion toCompanion(bool nullToAbsent) {
    return CustomExpensesCompanion(
      id: Value(id),
      dutyId: Value(dutyId),
      name: Value(name),
      amount: Value(amount),
    );
  }

  factory CustomExpense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomExpense(
      id: serializer.fromJson<int>(json['id']),
      dutyId: serializer.fromJson<int>(json['dutyId']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dutyId': serializer.toJson<int>(dutyId),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<int>(amount),
    };
  }

  CustomExpense copyWith({int? id, int? dutyId, String? name, int? amount}) =>
      CustomExpense(
        id: id ?? this.id,
        dutyId: dutyId ?? this.dutyId,
        name: name ?? this.name,
        amount: amount ?? this.amount,
      );
  CustomExpense copyWithCompanion(CustomExpensesCompanion data) {
    return CustomExpense(
      id: data.id.present ? data.id.value : this.id,
      dutyId: data.dutyId.present ? data.dutyId.value : this.dutyId,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomExpense(')
          ..write('id: $id, ')
          ..write('dutyId: $dutyId, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dutyId, name, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomExpense &&
          other.id == this.id &&
          other.dutyId == this.dutyId &&
          other.name == this.name &&
          other.amount == this.amount);
}

class CustomExpensesCompanion extends UpdateCompanion<CustomExpense> {
  final Value<int> id;
  final Value<int> dutyId;
  final Value<String> name;
  final Value<int> amount;
  const CustomExpensesCompanion({
    this.id = const Value.absent(),
    this.dutyId = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
  });
  CustomExpensesCompanion.insert({
    this.id = const Value.absent(),
    required int dutyId,
    required String name,
    required int amount,
  }) : dutyId = Value(dutyId),
       name = Value(name),
       amount = Value(amount);
  static Insertable<CustomExpense> custom({
    Expression<int>? id,
    Expression<int>? dutyId,
    Expression<String>? name,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dutyId != null) 'duty_id': dutyId,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
    });
  }

  CustomExpensesCompanion copyWith({
    Value<int>? id,
    Value<int>? dutyId,
    Value<String>? name,
    Value<int>? amount,
  }) {
    return CustomExpensesCompanion(
      id: id ?? this.id,
      dutyId: dutyId ?? this.dutyId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dutyId.present) {
      map['duty_id'] = Variable<int>(dutyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomExpensesCompanion(')
          ..write('id: $id, ')
          ..write('dutyId: $dutyId, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleMileageMeta = const VerificationMeta(
    'vehicleMileage',
  );
  @override
  late final GeneratedColumn<int> vehicleMileage = GeneratedColumn<int>(
    'vehicle_mileage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(18),
  );
  static const VerificationMeta _parkingEnabledMeta = const VerificationMeta(
    'parkingEnabled',
  );
  @override
  late final GeneratedColumn<bool> parkingEnabled = GeneratedColumn<bool>(
    'parking_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("parking_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _tollEnabledMeta = const VerificationMeta(
    'tollEnabled',
  );
  @override
  late final GeneratedColumn<bool> tollEnabled = GeneratedColumn<bool>(
    'toll_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("toll_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _serviceEnabledMeta = const VerificationMeta(
    'serviceEnabled',
  );
  @override
  late final GeneratedColumn<bool> serviceEnabled = GeneratedColumn<bool>(
    'service_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("service_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _tyreEnabledMeta = const VerificationMeta(
    'tyreEnabled',
  );
  @override
  late final GeneratedColumn<bool> tyreEnabled = GeneratedColumn<bool>(
    'tyre_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("tyre_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _insuranceEnabledMeta = const VerificationMeta(
    'insuranceEnabled',
  );
  @override
  late final GeneratedColumn<bool> insuranceEnabled = GeneratedColumn<bool>(
    'insurance_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("insurance_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _engineOilEnabledMeta = const VerificationMeta(
    'engineOilEnabled',
  );
  @override
  late final GeneratedColumn<bool> engineOilEnabled = GeneratedColumn<bool>(
    'engine_oil_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("engine_oil_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleMileage,
    parkingEnabled,
    tollEnabled,
    serviceEnabled,
    tyreEnabled,
    insuranceEnabled,
    engineOilEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_mileage')) {
      context.handle(
        _vehicleMileageMeta,
        vehicleMileage.isAcceptableOrUnknown(
          data['vehicle_mileage']!,
          _vehicleMileageMeta,
        ),
      );
    }
    if (data.containsKey('parking_enabled')) {
      context.handle(
        _parkingEnabledMeta,
        parkingEnabled.isAcceptableOrUnknown(
          data['parking_enabled']!,
          _parkingEnabledMeta,
        ),
      );
    }
    if (data.containsKey('toll_enabled')) {
      context.handle(
        _tollEnabledMeta,
        tollEnabled.isAcceptableOrUnknown(
          data['toll_enabled']!,
          _tollEnabledMeta,
        ),
      );
    }
    if (data.containsKey('service_enabled')) {
      context.handle(
        _serviceEnabledMeta,
        serviceEnabled.isAcceptableOrUnknown(
          data['service_enabled']!,
          _serviceEnabledMeta,
        ),
      );
    }
    if (data.containsKey('tyre_enabled')) {
      context.handle(
        _tyreEnabledMeta,
        tyreEnabled.isAcceptableOrUnknown(
          data['tyre_enabled']!,
          _tyreEnabledMeta,
        ),
      );
    }
    if (data.containsKey('insurance_enabled')) {
      context.handle(
        _insuranceEnabledMeta,
        insuranceEnabled.isAcceptableOrUnknown(
          data['insurance_enabled']!,
          _insuranceEnabledMeta,
        ),
      );
    }
    if (data.containsKey('engine_oil_enabled')) {
      context.handle(
        _engineOilEnabledMeta,
        engineOilEnabled.isAcceptableOrUnknown(
          data['engine_oil_enabled']!,
          _engineOilEnabledMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vehicleMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_mileage'],
      )!,
      parkingEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}parking_enabled'],
      )!,
      tollEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}toll_enabled'],
      )!,
      serviceEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}service_enabled'],
      )!,
      tyreEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}tyre_enabled'],
      )!,
      insuranceEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}insurance_enabled'],
      )!,
      engineOilEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}engine_oil_enabled'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final int vehicleMileage;
  final bool parkingEnabled;
  final bool tollEnabled;
  final bool serviceEnabled;
  final bool tyreEnabled;
  final bool insuranceEnabled;
  final bool engineOilEnabled;
  const Setting({
    required this.id,
    required this.vehicleMileage,
    required this.parkingEnabled,
    required this.tollEnabled,
    required this.serviceEnabled,
    required this.tyreEnabled,
    required this.insuranceEnabled,
    required this.engineOilEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_mileage'] = Variable<int>(vehicleMileage);
    map['parking_enabled'] = Variable<bool>(parkingEnabled);
    map['toll_enabled'] = Variable<bool>(tollEnabled);
    map['service_enabled'] = Variable<bool>(serviceEnabled);
    map['tyre_enabled'] = Variable<bool>(tyreEnabled);
    map['insurance_enabled'] = Variable<bool>(insuranceEnabled);
    map['engine_oil_enabled'] = Variable<bool>(engineOilEnabled);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      vehicleMileage: Value(vehicleMileage),
      parkingEnabled: Value(parkingEnabled),
      tollEnabled: Value(tollEnabled),
      serviceEnabled: Value(serviceEnabled),
      tyreEnabled: Value(tyreEnabled),
      insuranceEnabled: Value(insuranceEnabled),
      engineOilEnabled: Value(engineOilEnabled),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      vehicleMileage: serializer.fromJson<int>(json['vehicleMileage']),
      parkingEnabled: serializer.fromJson<bool>(json['parkingEnabled']),
      tollEnabled: serializer.fromJson<bool>(json['tollEnabled']),
      serviceEnabled: serializer.fromJson<bool>(json['serviceEnabled']),
      tyreEnabled: serializer.fromJson<bool>(json['tyreEnabled']),
      insuranceEnabled: serializer.fromJson<bool>(json['insuranceEnabled']),
      engineOilEnabled: serializer.fromJson<bool>(json['engineOilEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleMileage': serializer.toJson<int>(vehicleMileage),
      'parkingEnabled': serializer.toJson<bool>(parkingEnabled),
      'tollEnabled': serializer.toJson<bool>(tollEnabled),
      'serviceEnabled': serializer.toJson<bool>(serviceEnabled),
      'tyreEnabled': serializer.toJson<bool>(tyreEnabled),
      'insuranceEnabled': serializer.toJson<bool>(insuranceEnabled),
      'engineOilEnabled': serializer.toJson<bool>(engineOilEnabled),
    };
  }

  Setting copyWith({
    int? id,
    int? vehicleMileage,
    bool? parkingEnabled,
    bool? tollEnabled,
    bool? serviceEnabled,
    bool? tyreEnabled,
    bool? insuranceEnabled,
    bool? engineOilEnabled,
  }) => Setting(
    id: id ?? this.id,
    vehicleMileage: vehicleMileage ?? this.vehicleMileage,
    parkingEnabled: parkingEnabled ?? this.parkingEnabled,
    tollEnabled: tollEnabled ?? this.tollEnabled,
    serviceEnabled: serviceEnabled ?? this.serviceEnabled,
    tyreEnabled: tyreEnabled ?? this.tyreEnabled,
    insuranceEnabled: insuranceEnabled ?? this.insuranceEnabled,
    engineOilEnabled: engineOilEnabled ?? this.engineOilEnabled,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      vehicleMileage: data.vehicleMileage.present
          ? data.vehicleMileage.value
          : this.vehicleMileage,
      parkingEnabled: data.parkingEnabled.present
          ? data.parkingEnabled.value
          : this.parkingEnabled,
      tollEnabled: data.tollEnabled.present
          ? data.tollEnabled.value
          : this.tollEnabled,
      serviceEnabled: data.serviceEnabled.present
          ? data.serviceEnabled.value
          : this.serviceEnabled,
      tyreEnabled: data.tyreEnabled.present
          ? data.tyreEnabled.value
          : this.tyreEnabled,
      insuranceEnabled: data.insuranceEnabled.present
          ? data.insuranceEnabled.value
          : this.insuranceEnabled,
      engineOilEnabled: data.engineOilEnabled.present
          ? data.engineOilEnabled.value
          : this.engineOilEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('vehicleMileage: $vehicleMileage, ')
          ..write('parkingEnabled: $parkingEnabled, ')
          ..write('tollEnabled: $tollEnabled, ')
          ..write('serviceEnabled: $serviceEnabled, ')
          ..write('tyreEnabled: $tyreEnabled, ')
          ..write('insuranceEnabled: $insuranceEnabled, ')
          ..write('engineOilEnabled: $engineOilEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleMileage,
    parkingEnabled,
    tollEnabled,
    serviceEnabled,
    tyreEnabled,
    insuranceEnabled,
    engineOilEnabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.vehicleMileage == this.vehicleMileage &&
          other.parkingEnabled == this.parkingEnabled &&
          other.tollEnabled == this.tollEnabled &&
          other.serviceEnabled == this.serviceEnabled &&
          other.tyreEnabled == this.tyreEnabled &&
          other.insuranceEnabled == this.insuranceEnabled &&
          other.engineOilEnabled == this.engineOilEnabled);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<int> vehicleMileage;
  final Value<bool> parkingEnabled;
  final Value<bool> tollEnabled;
  final Value<bool> serviceEnabled;
  final Value<bool> tyreEnabled;
  final Value<bool> insuranceEnabled;
  final Value<bool> engineOilEnabled;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.vehicleMileage = const Value.absent(),
    this.parkingEnabled = const Value.absent(),
    this.tollEnabled = const Value.absent(),
    this.serviceEnabled = const Value.absent(),
    this.tyreEnabled = const Value.absent(),
    this.insuranceEnabled = const Value.absent(),
    this.engineOilEnabled = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.vehicleMileage = const Value.absent(),
    this.parkingEnabled = const Value.absent(),
    this.tollEnabled = const Value.absent(),
    this.serviceEnabled = const Value.absent(),
    this.tyreEnabled = const Value.absent(),
    this.insuranceEnabled = const Value.absent(),
    this.engineOilEnabled = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<int>? vehicleMileage,
    Expression<bool>? parkingEnabled,
    Expression<bool>? tollEnabled,
    Expression<bool>? serviceEnabled,
    Expression<bool>? tyreEnabled,
    Expression<bool>? insuranceEnabled,
    Expression<bool>? engineOilEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleMileage != null) 'vehicle_mileage': vehicleMileage,
      if (parkingEnabled != null) 'parking_enabled': parkingEnabled,
      if (tollEnabled != null) 'toll_enabled': tollEnabled,
      if (serviceEnabled != null) 'service_enabled': serviceEnabled,
      if (tyreEnabled != null) 'tyre_enabled': tyreEnabled,
      if (insuranceEnabled != null) 'insurance_enabled': insuranceEnabled,
      if (engineOilEnabled != null) 'engine_oil_enabled': engineOilEnabled,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? vehicleMileage,
    Value<bool>? parkingEnabled,
    Value<bool>? tollEnabled,
    Value<bool>? serviceEnabled,
    Value<bool>? tyreEnabled,
    Value<bool>? insuranceEnabled,
    Value<bool>? engineOilEnabled,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      vehicleMileage: vehicleMileage ?? this.vehicleMileage,
      parkingEnabled: parkingEnabled ?? this.parkingEnabled,
      tollEnabled: tollEnabled ?? this.tollEnabled,
      serviceEnabled: serviceEnabled ?? this.serviceEnabled,
      tyreEnabled: tyreEnabled ?? this.tyreEnabled,
      insuranceEnabled: insuranceEnabled ?? this.insuranceEnabled,
      engineOilEnabled: engineOilEnabled ?? this.engineOilEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleMileage.present) {
      map['vehicle_mileage'] = Variable<int>(vehicleMileage.value);
    }
    if (parkingEnabled.present) {
      map['parking_enabled'] = Variable<bool>(parkingEnabled.value);
    }
    if (tollEnabled.present) {
      map['toll_enabled'] = Variable<bool>(tollEnabled.value);
    }
    if (serviceEnabled.present) {
      map['service_enabled'] = Variable<bool>(serviceEnabled.value);
    }
    if (tyreEnabled.present) {
      map['tyre_enabled'] = Variable<bool>(tyreEnabled.value);
    }
    if (insuranceEnabled.present) {
      map['insurance_enabled'] = Variable<bool>(insuranceEnabled.value);
    }
    if (engineOilEnabled.present) {
      map['engine_oil_enabled'] = Variable<bool>(engineOilEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleMileage: $vehicleMileage, ')
          ..write('parkingEnabled: $parkingEnabled, ')
          ..write('tollEnabled: $tollEnabled, ')
          ..write('serviceEnabled: $serviceEnabled, ')
          ..write('tyreEnabled: $tyreEnabled, ')
          ..write('insuranceEnabled: $insuranceEnabled, ')
          ..write('engineOilEnabled: $engineOilEnabled')
          ..write(')'))
        .toString();
  }
}

class $MonthlyFuelPricesTable extends MonthlyFuelPrices
    with TableInfo<$MonthlyFuelPricesTable, MonthlyFuelPrice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MonthlyFuelPricesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fuelPriceMeta = const VerificationMeta(
    'fuelPrice',
  );
  @override
  late final GeneratedColumn<int> fuelPrice = GeneratedColumn<int>(
    'fuel_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, year, month, fuelPrice];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'monthly_fuel_prices';
  @override
  VerificationContext validateIntegrity(
    Insertable<MonthlyFuelPrice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('fuel_price')) {
      context.handle(
        _fuelPriceMeta,
        fuelPrice.isAcceptableOrUnknown(data['fuel_price']!, _fuelPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_fuelPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {year, month},
  ];
  @override
  MonthlyFuelPrice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyFuelPrice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      fuelPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fuel_price'],
      )!,
    );
  }

  @override
  $MonthlyFuelPricesTable createAlias(String alias) {
    return $MonthlyFuelPricesTable(attachedDatabase, alias);
  }
}

class MonthlyFuelPrice extends DataClass
    implements Insertable<MonthlyFuelPrice> {
  final int id;
  final int year;
  final int month;
  final int fuelPrice;
  const MonthlyFuelPrice({
    required this.id,
    required this.year,
    required this.month,
    required this.fuelPrice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['fuel_price'] = Variable<int>(fuelPrice);
    return map;
  }

  MonthlyFuelPricesCompanion toCompanion(bool nullToAbsent) {
    return MonthlyFuelPricesCompanion(
      id: Value(id),
      year: Value(year),
      month: Value(month),
      fuelPrice: Value(fuelPrice),
    );
  }

  factory MonthlyFuelPrice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyFuelPrice(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      fuelPrice: serializer.fromJson<int>(json['fuelPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'fuelPrice': serializer.toJson<int>(fuelPrice),
    };
  }

  MonthlyFuelPrice copyWith({int? id, int? year, int? month, int? fuelPrice}) =>
      MonthlyFuelPrice(
        id: id ?? this.id,
        year: year ?? this.year,
        month: month ?? this.month,
        fuelPrice: fuelPrice ?? this.fuelPrice,
      );
  MonthlyFuelPrice copyWithCompanion(MonthlyFuelPricesCompanion data) {
    return MonthlyFuelPrice(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      month: data.month.present ? data.month.value : this.month,
      fuelPrice: data.fuelPrice.present ? data.fuelPrice.value : this.fuelPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyFuelPrice(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('fuelPrice: $fuelPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, year, month, fuelPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyFuelPrice &&
          other.id == this.id &&
          other.year == this.year &&
          other.month == this.month &&
          other.fuelPrice == this.fuelPrice);
}

class MonthlyFuelPricesCompanion extends UpdateCompanion<MonthlyFuelPrice> {
  final Value<int> id;
  final Value<int> year;
  final Value<int> month;
  final Value<int> fuelPrice;
  const MonthlyFuelPricesCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.fuelPrice = const Value.absent(),
  });
  MonthlyFuelPricesCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    required int month,
    required int fuelPrice,
  }) : year = Value(year),
       month = Value(month),
       fuelPrice = Value(fuelPrice);
  static Insertable<MonthlyFuelPrice> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<int>? month,
    Expression<int>? fuelPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (fuelPrice != null) 'fuel_price': fuelPrice,
    });
  }

  MonthlyFuelPricesCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<int>? month,
    Value<int>? fuelPrice,
  }) {
    return MonthlyFuelPricesCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      month: month ?? this.month,
      fuelPrice: fuelPrice ?? this.fuelPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (fuelPrice.present) {
      map['fuel_price'] = Variable<int>(fuelPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyFuelPricesCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('fuelPrice: $fuelPrice')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DutiesTable duties = $DutiesTable(this);
  late final $CustomExpensesTable customExpenses = $CustomExpensesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $MonthlyFuelPricesTable monthlyFuelPrices =
      $MonthlyFuelPricesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    duties,
    customExpenses,
    settings,
    monthlyFuelPrices,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'duties',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('custom_expenses', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DutiesTableCreateCompanionBuilder =
    DutiesCompanion Function({
      Value<int> id,
      required DateTime date,
      required String place,
      required int startKm,
      required int endKm,
      required int totalKm,
      required AcType acType,
      required int rent,
      required int fuelCost,
      Value<int> parking,
      Value<int> toll,
      Value<int> service,
      Value<int> tyre,
      Value<int> insurance,
      Value<int> engineOil,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DutiesTableUpdateCompanionBuilder =
    DutiesCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> place,
      Value<int> startKm,
      Value<int> endKm,
      Value<int> totalKm,
      Value<AcType> acType,
      Value<int> rent,
      Value<int> fuelCost,
      Value<int> parking,
      Value<int> toll,
      Value<int> service,
      Value<int> tyre,
      Value<int> insurance,
      Value<int> engineOil,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DutiesTableReferences
    extends BaseReferences<_$AppDatabase, $DutiesTable, Duty> {
  $$DutiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomExpensesTable, List<CustomExpense>>
  _customExpensesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customExpenses,
    aliasName: 'duties__id__custom_expenses__duty_id',
  );

  $$CustomExpensesTableProcessedTableManager get customExpensesRefs {
    final manager = $$CustomExpensesTableTableManager(
      $_db,
      $_db.customExpenses,
    ).filter((f) => f.dutyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_customExpensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DutiesTableFilterComposer
    extends Composer<_$AppDatabase, $DutiesTable> {
  $$DutiesTableFilterComposer({
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

  ColumnFilters<String> get place => $composableBuilder(
    column: $table.place,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startKm => $composableBuilder(
    column: $table.startKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endKm => $composableBuilder(
    column: $table.endKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalKm => $composableBuilder(
    column: $table.totalKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AcType, AcType, String> get acType =>
      $composableBuilder(
        column: $table.acType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get rent => $composableBuilder(
    column: $table.rent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fuelCost => $composableBuilder(
    column: $table.fuelCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parking => $composableBuilder(
    column: $table.parking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toll => $composableBuilder(
    column: $table.toll,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get service => $composableBuilder(
    column: $table.service,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tyre => $composableBuilder(
    column: $table.tyre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get insurance => $composableBuilder(
    column: $table.insurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get engineOil => $composableBuilder(
    column: $table.engineOil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> customExpensesRefs(
    Expression<bool> Function($$CustomExpensesTableFilterComposer f) f,
  ) {
    final $$CustomExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customExpenses,
      getReferencedColumn: (t) => t.dutyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomExpensesTableFilterComposer(
            $db: $db,
            $table: $db.customExpenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DutiesTableOrderingComposer
    extends Composer<_$AppDatabase, $DutiesTable> {
  $$DutiesTableOrderingComposer({
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

  ColumnOrderings<String> get place => $composableBuilder(
    column: $table.place,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startKm => $composableBuilder(
    column: $table.startKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endKm => $composableBuilder(
    column: $table.endKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalKm => $composableBuilder(
    column: $table.totalKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acType => $composableBuilder(
    column: $table.acType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rent => $composableBuilder(
    column: $table.rent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fuelCost => $composableBuilder(
    column: $table.fuelCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parking => $composableBuilder(
    column: $table.parking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toll => $composableBuilder(
    column: $table.toll,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get service => $composableBuilder(
    column: $table.service,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tyre => $composableBuilder(
    column: $table.tyre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get insurance => $composableBuilder(
    column: $table.insurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get engineOil => $composableBuilder(
    column: $table.engineOil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DutiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DutiesTable> {
  $$DutiesTableAnnotationComposer({
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

  GeneratedColumn<String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumn<int> get startKm =>
      $composableBuilder(column: $table.startKm, builder: (column) => column);

  GeneratedColumn<int> get endKm =>
      $composableBuilder(column: $table.endKm, builder: (column) => column);

  GeneratedColumn<int> get totalKm =>
      $composableBuilder(column: $table.totalKm, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AcType, String> get acType =>
      $composableBuilder(column: $table.acType, builder: (column) => column);

  GeneratedColumn<int> get rent =>
      $composableBuilder(column: $table.rent, builder: (column) => column);

  GeneratedColumn<int> get fuelCost =>
      $composableBuilder(column: $table.fuelCost, builder: (column) => column);

  GeneratedColumn<int> get parking =>
      $composableBuilder(column: $table.parking, builder: (column) => column);

  GeneratedColumn<int> get toll =>
      $composableBuilder(column: $table.toll, builder: (column) => column);

  GeneratedColumn<int> get service =>
      $composableBuilder(column: $table.service, builder: (column) => column);

  GeneratedColumn<int> get tyre =>
      $composableBuilder(column: $table.tyre, builder: (column) => column);

  GeneratedColumn<int> get insurance =>
      $composableBuilder(column: $table.insurance, builder: (column) => column);

  GeneratedColumn<int> get engineOil =>
      $composableBuilder(column: $table.engineOil, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> customExpensesRefs<T extends Object>(
    Expression<T> Function($$CustomExpensesTableAnnotationComposer a) f,
  ) {
    final $$CustomExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customExpenses,
      getReferencedColumn: (t) => t.dutyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.customExpenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DutiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DutiesTable,
          Duty,
          $$DutiesTableFilterComposer,
          $$DutiesTableOrderingComposer,
          $$DutiesTableAnnotationComposer,
          $$DutiesTableCreateCompanionBuilder,
          $$DutiesTableUpdateCompanionBuilder,
          (Duty, $$DutiesTableReferences),
          Duty,
          PrefetchHooks Function({bool customExpensesRefs})
        > {
  $$DutiesTableTableManager(_$AppDatabase db, $DutiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DutiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DutiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DutiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> place = const Value.absent(),
                Value<int> startKm = const Value.absent(),
                Value<int> endKm = const Value.absent(),
                Value<int> totalKm = const Value.absent(),
                Value<AcType> acType = const Value.absent(),
                Value<int> rent = const Value.absent(),
                Value<int> fuelCost = const Value.absent(),
                Value<int> parking = const Value.absent(),
                Value<int> toll = const Value.absent(),
                Value<int> service = const Value.absent(),
                Value<int> tyre = const Value.absent(),
                Value<int> insurance = const Value.absent(),
                Value<int> engineOil = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DutiesCompanion(
                id: id,
                date: date,
                place: place,
                startKm: startKm,
                endKm: endKm,
                totalKm: totalKm,
                acType: acType,
                rent: rent,
                fuelCost: fuelCost,
                parking: parking,
                toll: toll,
                service: service,
                tyre: tyre,
                insurance: insurance,
                engineOil: engineOil,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String place,
                required int startKm,
                required int endKm,
                required int totalKm,
                required AcType acType,
                required int rent,
                required int fuelCost,
                Value<int> parking = const Value.absent(),
                Value<int> toll = const Value.absent(),
                Value<int> service = const Value.absent(),
                Value<int> tyre = const Value.absent(),
                Value<int> insurance = const Value.absent(),
                Value<int> engineOil = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DutiesCompanion.insert(
                id: id,
                date: date,
                place: place,
                startKm: startKm,
                endKm: endKm,
                totalKm: totalKm,
                acType: acType,
                rent: rent,
                fuelCost: fuelCost,
                parking: parking,
                toll: toll,
                service: service,
                tyre: tyre,
                insurance: insurance,
                engineOil: engineOil,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$DutiesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({customExpensesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (customExpensesRefs) db.customExpenses,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customExpensesRefs)
                    await $_getPrefetchedData<
                      Duty,
                      $DutiesTable,
                      CustomExpense
                    >(
                      currentTable: table,
                      referencedTable: $$DutiesTableReferences
                          ._customExpensesRefsTable(db),
                      managerFromTypedResult: (p0) => $$DutiesTableReferences(
                        db,
                        table,
                        p0,
                      ).customExpensesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.dutyId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DutiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DutiesTable,
      Duty,
      $$DutiesTableFilterComposer,
      $$DutiesTableOrderingComposer,
      $$DutiesTableAnnotationComposer,
      $$DutiesTableCreateCompanionBuilder,
      $$DutiesTableUpdateCompanionBuilder,
      (Duty, $$DutiesTableReferences),
      Duty,
      PrefetchHooks Function({bool customExpensesRefs})
    >;
typedef $$CustomExpensesTableCreateCompanionBuilder =
    CustomExpensesCompanion Function({
      Value<int> id,
      required int dutyId,
      required String name,
      required int amount,
    });
typedef $$CustomExpensesTableUpdateCompanionBuilder =
    CustomExpensesCompanion Function({
      Value<int> id,
      Value<int> dutyId,
      Value<String> name,
      Value<int> amount,
    });

final class $$CustomExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $CustomExpensesTable, CustomExpense> {
  $$CustomExpensesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DutiesTable _dutyIdTable(_$AppDatabase db) =>
      db.duties.createAlias('custom_expenses__duty_id__duties__id');

  $$DutiesTableProcessedTableManager get dutyId {
    final $_column = $_itemColumn<int>('duty_id')!;

    final manager = $$DutiesTableTableManager(
      $_db,
      $_db.duties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dutyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CustomExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomExpensesTable> {
  $$CustomExpensesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$DutiesTableFilterComposer get dutyId {
    final $$DutiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dutyId,
      referencedTable: $db.duties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DutiesTableFilterComposer(
            $db: $db,
            $table: $db.duties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomExpensesTable> {
  $$CustomExpensesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$DutiesTableOrderingComposer get dutyId {
    final $$DutiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dutyId,
      referencedTable: $db.duties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DutiesTableOrderingComposer(
            $db: $db,
            $table: $db.duties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomExpensesTable> {
  $$CustomExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$DutiesTableAnnotationComposer get dutyId {
    final $$DutiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dutyId,
      referencedTable: $db.duties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DutiesTableAnnotationComposer(
            $db: $db,
            $table: $db.duties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomExpensesTable,
          CustomExpense,
          $$CustomExpensesTableFilterComposer,
          $$CustomExpensesTableOrderingComposer,
          $$CustomExpensesTableAnnotationComposer,
          $$CustomExpensesTableCreateCompanionBuilder,
          $$CustomExpensesTableUpdateCompanionBuilder,
          (CustomExpense, $$CustomExpensesTableReferences),
          CustomExpense,
          PrefetchHooks Function({bool dutyId})
        > {
  $$CustomExpensesTableTableManager(
    _$AppDatabase db,
    $CustomExpensesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dutyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => CustomExpensesCompanion(
                id: id,
                dutyId: dutyId,
                name: name,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dutyId,
                required String name,
                required int amount,
              }) => CustomExpensesCompanion.insert(
                id: id,
                dutyId: dutyId,
                name: name,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomExpensesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dutyId = false}) {
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
                    if (dutyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dutyId,
                                referencedTable: $$CustomExpensesTableReferences
                                    ._dutyIdTable(db),
                                referencedColumn:
                                    $$CustomExpensesTableReferences
                                        ._dutyIdTable(db)
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

typedef $$CustomExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomExpensesTable,
      CustomExpense,
      $$CustomExpensesTableFilterComposer,
      $$CustomExpensesTableOrderingComposer,
      $$CustomExpensesTableAnnotationComposer,
      $$CustomExpensesTableCreateCompanionBuilder,
      $$CustomExpensesTableUpdateCompanionBuilder,
      (CustomExpense, $$CustomExpensesTableReferences),
      CustomExpense,
      PrefetchHooks Function({bool dutyId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int> vehicleMileage,
      Value<bool> parkingEnabled,
      Value<bool> tollEnabled,
      Value<bool> serviceEnabled,
      Value<bool> tyreEnabled,
      Value<bool> insuranceEnabled,
      Value<bool> engineOilEnabled,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int> vehicleMileage,
      Value<bool> parkingEnabled,
      Value<bool> tollEnabled,
      Value<bool> serviceEnabled,
      Value<bool> tyreEnabled,
      Value<bool> insuranceEnabled,
      Value<bool> engineOilEnabled,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
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

  ColumnFilters<int> get vehicleMileage => $composableBuilder(
    column: $table.vehicleMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get parkingEnabled => $composableBuilder(
    column: $table.parkingEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get tollEnabled => $composableBuilder(
    column: $table.tollEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get serviceEnabled => $composableBuilder(
    column: $table.serviceEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get tyreEnabled => $composableBuilder(
    column: $table.tyreEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get insuranceEnabled => $composableBuilder(
    column: $table.insuranceEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get engineOilEnabled => $composableBuilder(
    column: $table.engineOilEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
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

  ColumnOrderings<int> get vehicleMileage => $composableBuilder(
    column: $table.vehicleMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get parkingEnabled => $composableBuilder(
    column: $table.parkingEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get tollEnabled => $composableBuilder(
    column: $table.tollEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serviceEnabled => $composableBuilder(
    column: $table.serviceEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get tyreEnabled => $composableBuilder(
    column: $table.tyreEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get insuranceEnabled => $composableBuilder(
    column: $table.insuranceEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get engineOilEnabled => $composableBuilder(
    column: $table.engineOilEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get vehicleMileage => $composableBuilder(
    column: $table.vehicleMileage,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get parkingEnabled => $composableBuilder(
    column: $table.parkingEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get tollEnabled => $composableBuilder(
    column: $table.tollEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serviceEnabled => $composableBuilder(
    column: $table.serviceEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get tyreEnabled => $composableBuilder(
    column: $table.tyreEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get insuranceEnabled => $composableBuilder(
    column: $table.insuranceEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get engineOilEnabled => $composableBuilder(
    column: $table.engineOilEnabled,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleMileage = const Value.absent(),
                Value<bool> parkingEnabled = const Value.absent(),
                Value<bool> tollEnabled = const Value.absent(),
                Value<bool> serviceEnabled = const Value.absent(),
                Value<bool> tyreEnabled = const Value.absent(),
                Value<bool> insuranceEnabled = const Value.absent(),
                Value<bool> engineOilEnabled = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                vehicleMileage: vehicleMileage,
                parkingEnabled: parkingEnabled,
                tollEnabled: tollEnabled,
                serviceEnabled: serviceEnabled,
                tyreEnabled: tyreEnabled,
                insuranceEnabled: insuranceEnabled,
                engineOilEnabled: engineOilEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleMileage = const Value.absent(),
                Value<bool> parkingEnabled = const Value.absent(),
                Value<bool> tollEnabled = const Value.absent(),
                Value<bool> serviceEnabled = const Value.absent(),
                Value<bool> tyreEnabled = const Value.absent(),
                Value<bool> insuranceEnabled = const Value.absent(),
                Value<bool> engineOilEnabled = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                vehicleMileage: vehicleMileage,
                parkingEnabled: parkingEnabled,
                tollEnabled: tollEnabled,
                serviceEnabled: serviceEnabled,
                tyreEnabled: tyreEnabled,
                insuranceEnabled: insuranceEnabled,
                engineOilEnabled: engineOilEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$MonthlyFuelPricesTableCreateCompanionBuilder =
    MonthlyFuelPricesCompanion Function({
      Value<int> id,
      required int year,
      required int month,
      required int fuelPrice,
    });
typedef $$MonthlyFuelPricesTableUpdateCompanionBuilder =
    MonthlyFuelPricesCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<int> month,
      Value<int> fuelPrice,
    });

class $$MonthlyFuelPricesTableFilterComposer
    extends Composer<_$AppDatabase, $MonthlyFuelPricesTable> {
  $$MonthlyFuelPricesTableFilterComposer({
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

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fuelPrice => $composableBuilder(
    column: $table.fuelPrice,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MonthlyFuelPricesTableOrderingComposer
    extends Composer<_$AppDatabase, $MonthlyFuelPricesTable> {
  $$MonthlyFuelPricesTableOrderingComposer({
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

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fuelPrice => $composableBuilder(
    column: $table.fuelPrice,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MonthlyFuelPricesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MonthlyFuelPricesTable> {
  $$MonthlyFuelPricesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<int> get fuelPrice =>
      $composableBuilder(column: $table.fuelPrice, builder: (column) => column);
}

class $$MonthlyFuelPricesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MonthlyFuelPricesTable,
          MonthlyFuelPrice,
          $$MonthlyFuelPricesTableFilterComposer,
          $$MonthlyFuelPricesTableOrderingComposer,
          $$MonthlyFuelPricesTableAnnotationComposer,
          $$MonthlyFuelPricesTableCreateCompanionBuilder,
          $$MonthlyFuelPricesTableUpdateCompanionBuilder,
          (
            MonthlyFuelPrice,
            BaseReferences<
              _$AppDatabase,
              $MonthlyFuelPricesTable,
              MonthlyFuelPrice
            >,
          ),
          MonthlyFuelPrice,
          PrefetchHooks Function()
        > {
  $$MonthlyFuelPricesTableTableManager(
    _$AppDatabase db,
    $MonthlyFuelPricesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MonthlyFuelPricesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MonthlyFuelPricesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MonthlyFuelPricesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<int> fuelPrice = const Value.absent(),
              }) => MonthlyFuelPricesCompanion(
                id: id,
                year: year,
                month: month,
                fuelPrice: fuelPrice,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                required int month,
                required int fuelPrice,
              }) => MonthlyFuelPricesCompanion.insert(
                id: id,
                year: year,
                month: month,
                fuelPrice: fuelPrice,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MonthlyFuelPricesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MonthlyFuelPricesTable,
      MonthlyFuelPrice,
      $$MonthlyFuelPricesTableFilterComposer,
      $$MonthlyFuelPricesTableOrderingComposer,
      $$MonthlyFuelPricesTableAnnotationComposer,
      $$MonthlyFuelPricesTableCreateCompanionBuilder,
      $$MonthlyFuelPricesTableUpdateCompanionBuilder,
      (
        MonthlyFuelPrice,
        BaseReferences<
          _$AppDatabase,
          $MonthlyFuelPricesTable,
          MonthlyFuelPrice
        >,
      ),
      MonthlyFuelPrice,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DutiesTableTableManager get duties =>
      $$DutiesTableTableManager(_db, _db.duties);
  $$CustomExpensesTableTableManager get customExpenses =>
      $$CustomExpensesTableTableManager(_db, _db.customExpenses);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$MonthlyFuelPricesTableTableManager get monthlyFuelPrices =>
      $$MonthlyFuelPricesTableTableManager(_db, _db.monthlyFuelPrices);
}
