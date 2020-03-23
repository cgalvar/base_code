// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CustomFeatureData extends DataClass
    implements Insertable<CustomFeatureData> {
  final int id;
  final String customProperty;
  CustomFeatureData({@required this.id, @required this.customProperty});
  factory CustomFeatureData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CustomFeatureData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      customProperty: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}custom_property']),
    );
  }
  factory CustomFeatureData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CustomFeatureData(
      id: serializer.fromJson<int>(json['id']),
      customProperty: serializer.fromJson<String>(json['customProperty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customProperty': serializer.toJson<String>(customProperty),
    };
  }

  @override
  CustomFeatureDataCompanion createCompanion(bool nullToAbsent) {
    return CustomFeatureDataCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      customProperty: customProperty == null && nullToAbsent
          ? const Value.absent()
          : Value(customProperty),
    );
  }

  CustomFeatureData copyWith({int id, String customProperty}) =>
      CustomFeatureData(
        id: id ?? this.id,
        customProperty: customProperty ?? this.customProperty,
      );
  @override
  String toString() {
    return (StringBuffer('CustomFeatureData(')
          ..write('id: $id, ')
          ..write('customProperty: $customProperty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, customProperty.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CustomFeatureData &&
          other.id == this.id &&
          other.customProperty == this.customProperty);
}

class CustomFeatureDataCompanion extends UpdateCompanion<CustomFeatureData> {
  final Value<int> id;
  final Value<String> customProperty;
  const CustomFeatureDataCompanion({
    this.id = const Value.absent(),
    this.customProperty = const Value.absent(),
  });
  CustomFeatureDataCompanion.insert({
    this.id = const Value.absent(),
    @required String customProperty,
  }) : customProperty = Value(customProperty);
  CustomFeatureDataCompanion copyWith(
      {Value<int> id, Value<String> customProperty}) {
    return CustomFeatureDataCompanion(
      id: id ?? this.id,
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class $CustomFeatureMoorTableTable extends CustomFeatureMoorTable
    with TableInfo<$CustomFeatureMoorTableTable, CustomFeatureData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CustomFeatureMoorTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _customPropertyMeta =
      const VerificationMeta('customProperty');
  GeneratedTextColumn _customProperty;
  @override
  GeneratedTextColumn get customProperty =>
      _customProperty ??= _constructCustomProperty();
  GeneratedTextColumn _constructCustomProperty() {
    return GeneratedTextColumn(
      'custom_property',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, customProperty];
  @override
  $CustomFeatureMoorTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'custom_feature_moor_table';
  @override
  final String actualTableName = 'custom_feature_moor_table';
  @override
  VerificationContext validateIntegrity(CustomFeatureDataCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.customProperty.present) {
      context.handle(
          _customPropertyMeta,
          customProperty.isAcceptableValue(
              d.customProperty.value, _customPropertyMeta));
    } else if (isInserting) {
      context.missing(_customPropertyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomFeatureData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CustomFeatureData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CustomFeatureDataCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.customProperty.present) {
      map['custom_property'] =
          Variable<String, StringType>(d.customProperty.value);
    }
    return map;
  }

  @override
  $CustomFeatureMoorTableTable createAlias(String alias) {
    return $CustomFeatureMoorTableTable(_db, alias);
  }
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CustomFeatureMoorTableTable _customFeatureMoorTable;
  $CustomFeatureMoorTableTable get customFeatureMoorTable =>
      _customFeatureMoorTable ??= $CustomFeatureMoorTableTable(this);
  CustomFeatureDao _customFeatureDao;
  CustomFeatureDao get customFeatureDao =>
      _customFeatureDao ??= CustomFeatureDao(this as MoorDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customFeatureMoorTable];
}
