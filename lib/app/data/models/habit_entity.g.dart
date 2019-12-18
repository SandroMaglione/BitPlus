// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HabitEntity> _$habitEntitySerializer = new _$HabitEntitySerializer();

class _$HabitEntitySerializer implements StructuredSerializer<HabitEntity> {
  @override
  final Iterable<Type> types = const [HabitEntity, _$HabitEntity];
  @override
  final String wireName = 'HabitEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, HabitEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'habitEntity',
      serializers.serialize(object.habitEntity,
          specifiedType: const FullType(HabitEntity)),
      'isChecked',
      serializers.serialize(object.isChecked,
          specifiedType: const FullType(bool)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  HabitEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HabitEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'habitEntity':
          result.habitEntity.replace(serializers.deserialize(value,
              specifiedType: const FullType(HabitEntity)) as HabitEntity);
          break;
        case 'isChecked':
          result.isChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$HabitEntity extends HabitEntity {
  @override
  final HabitEntity habitEntity;
  @override
  final bool isChecked;
  @override
  final DateTime date;

  factory _$HabitEntity([void Function(HabitEntityBuilder) updates]) =>
      (new HabitEntityBuilder()..update(updates)).build();

  _$HabitEntity._({this.habitEntity, this.isChecked, this.date}) : super._() {
    if (habitEntity == null) {
      throw new BuiltValueNullFieldError('HabitEntity', 'habitEntity');
    }
    if (isChecked == null) {
      throw new BuiltValueNullFieldError('HabitEntity', 'isChecked');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('HabitEntity', 'date');
    }
  }

  @override
  HabitEntity rebuild(void Function(HabitEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HabitEntityBuilder toBuilder() => new HabitEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HabitEntity &&
        habitEntity == other.habitEntity &&
        isChecked == other.isChecked &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, habitEntity.hashCode), isChecked.hashCode), date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HabitEntity')
          ..add('habitEntity', habitEntity)
          ..add('isChecked', isChecked)
          ..add('date', date))
        .toString();
  }
}

class HabitEntityBuilder implements Builder<HabitEntity, HabitEntityBuilder> {
  _$HabitEntity _$v;

  HabitEntityBuilder _habitEntity;
  HabitEntityBuilder get habitEntity =>
      _$this._habitEntity ??= new HabitEntityBuilder();
  set habitEntity(HabitEntityBuilder habitEntity) =>
      _$this._habitEntity = habitEntity;

  bool _isChecked;
  bool get isChecked => _$this._isChecked;
  set isChecked(bool isChecked) => _$this._isChecked = isChecked;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  HabitEntityBuilder();

  HabitEntityBuilder get _$this {
    if (_$v != null) {
      _habitEntity = _$v.habitEntity?.toBuilder();
      _isChecked = _$v.isChecked;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HabitEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HabitEntity;
  }

  @override
  void update(void Function(HabitEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HabitEntity build() {
    _$HabitEntity _$result;
    try {
      _$result = _$v ??
          new _$HabitEntity._(
              habitEntity: habitEntity.build(),
              isChecked: isChecked,
              date: date);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'habitEntity';
        habitEntity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HabitEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
