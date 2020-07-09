// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ToDoEntity extends DataClass implements Insertable<ToDoEntity> {
  final int id;
  final String todo;
  final DateTime created;
  ToDoEntity({@required this.id, @required this.todo, @required this.created});
  factory ToDoEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ToDoEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      todo: stringType.mapFromDatabaseResponse(data['${effectivePrefix}todo']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || todo != null) {
      map['todo'] = Variable<String>(todo);
    }
    if (!nullToAbsent || created != null) {
      map['created'] = Variable<DateTime>(created);
    }
    return map;
  }

  ToDoEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ToDoEntitiesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      todo: todo == null && nullToAbsent ? const Value.absent() : Value(todo),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
    );
  }

  factory ToDoEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoEntity(
      id: serializer.fromJson<int>(json['id']),
      todo: serializer.fromJson<String>(json['todo']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'todo': serializer.toJson<String>(todo),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  ToDoEntity copyWith({int id, String todo, DateTime created}) => ToDoEntity(
        id: id ?? this.id,
        todo: todo ?? this.todo,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoEntity(')
          ..write('id: $id, ')
          ..write('todo: $todo, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(todo.hashCode, created.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ToDoEntity &&
          other.id == this.id &&
          other.todo == this.todo &&
          other.created == this.created);
}

class ToDoEntitiesCompanion extends UpdateCompanion<ToDoEntity> {
  final Value<int> id;
  final Value<String> todo;
  final Value<DateTime> created;
  const ToDoEntitiesCompanion({
    this.id = const Value.absent(),
    this.todo = const Value.absent(),
    this.created = const Value.absent(),
  });
  ToDoEntitiesCompanion.insert({
    this.id = const Value.absent(),
    @required String todo,
    @required DateTime created,
  })  : todo = Value(todo),
        created = Value(created);
  static Insertable<ToDoEntity> custom({
    Expression<int> id,
    Expression<String> todo,
    Expression<DateTime> created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (todo != null) 'todo': todo,
      if (created != null) 'created': created,
    });
  }

  ToDoEntitiesCompanion copyWith(
      {Value<int> id, Value<String> todo, Value<DateTime> created}) {
    return ToDoEntitiesCompanion(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (todo.present) {
      map['todo'] = Variable<String>(todo.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('todo: $todo, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $ToDoEntitiesTable extends ToDoEntities
    with TableInfo<$ToDoEntitiesTable, ToDoEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ToDoEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _todoMeta = const VerificationMeta('todo');
  GeneratedTextColumn _todo;
  @override
  GeneratedTextColumn get todo => _todo ??= _constructTodo();
  GeneratedTextColumn _constructTodo() {
    return GeneratedTextColumn('todo', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedDateTimeColumn _created;
  @override
  GeneratedDateTimeColumn get created => _created ??= _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn(
      'created',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, todo, created];
  @override
  $ToDoEntitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'to_do_entities';
  @override
  final String actualTableName = 'to_do_entities';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('todo')) {
      context.handle(
          _todoMeta, todo.isAcceptableOrUnknown(data['todo'], _todoMeta));
    } else if (isInserting) {
      context.missing(_todoMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created'], _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ToDoEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ToDoEntitiesTable createAlias(String alias) {
    return $ToDoEntitiesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ToDoEntitiesTable _toDoEntities;
  $ToDoEntitiesTable get toDoEntities =>
      _toDoEntities ??= $ToDoEntitiesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoEntities];
}
