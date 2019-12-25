// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HabitStat> _$habitStatSerializer = new _$HabitStatSerializer();

class _$HabitStatSerializer implements StructuredSerializer<HabitStat> {
  @override
  final Iterable<Type> types = const [HabitStat, _$HabitStat];
  @override
  final String wireName = 'HabitStat';

  @override
  Iterable<Object> serialize(Serializers serializers, HabitStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'habit',
      serializers.serialize(object.habit, specifiedType: const FullType(Habit)),
      'habitEntities',
      serializers.serialize(object.habitEntities,
          specifiedType:
              const FullType(BuiltList, const [const FullType(HabitEntity)])),
      'startDate',
      serializers.serialize(object.startDate,
          specifiedType: const FullType(DateTime)),
      'endDate',
      serializers.serialize(object.endDate,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  HabitStat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HabitStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'habit':
          result.habit.replace(serializers.deserialize(value,
              specifiedType: const FullType(Habit)) as Habit);
          break;
        case 'habitEntities':
          result.habitEntities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HabitEntity)]))
              as BuiltList<dynamic>);
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$HabitStat extends HabitStat {
  @override
  final Habit habit;
  @override
  final BuiltList<HabitEntity> habitEntities;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  factory _$HabitStat([void Function(HabitStatBuilder) updates]) =>
      (new HabitStatBuilder()..update(updates)).build();

  _$HabitStat._({this.habit, this.habitEntities, this.startDate, this.endDate})
      : super._() {
    if (habit == null) {
      throw new BuiltValueNullFieldError('HabitStat', 'habit');
    }
    if (habitEntities == null) {
      throw new BuiltValueNullFieldError('HabitStat', 'habitEntities');
    }
    if (startDate == null) {
      throw new BuiltValueNullFieldError('HabitStat', 'startDate');
    }
    if (endDate == null) {
      throw new BuiltValueNullFieldError('HabitStat', 'endDate');
    }
  }

  @override
  HabitStat rebuild(void Function(HabitStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HabitStatBuilder toBuilder() => new HabitStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HabitStat &&
        habit == other.habit &&
        habitEntities == other.habitEntities &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, habit.hashCode), habitEntities.hashCode),
            startDate.hashCode),
        endDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HabitStat')
          ..add('habit', habit)
          ..add('habitEntities', habitEntities)
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class HabitStatBuilder implements Builder<HabitStat, HabitStatBuilder> {
  _$HabitStat _$v;

  HabitBuilder _habit;
  HabitBuilder get habit => _$this._habit ??= new HabitBuilder();
  set habit(HabitBuilder habit) => _$this._habit = habit;

  ListBuilder<HabitEntity> _habitEntities;
  ListBuilder<HabitEntity> get habitEntities =>
      _$this._habitEntities ??= new ListBuilder<HabitEntity>();
  set habitEntities(ListBuilder<HabitEntity> habitEntities) =>
      _$this._habitEntities = habitEntities;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  HabitStatBuilder();

  HabitStatBuilder get _$this {
    if (_$v != null) {
      _habit = _$v.habit?.toBuilder();
      _habitEntities = _$v.habitEntities?.toBuilder();
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HabitStat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HabitStat;
  }

  @override
  void update(void Function(HabitStatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HabitStat build() {
    _$HabitStat _$result;
    try {
      _$result = _$v ??
          new _$HabitStat._(
              habit: habit.build(),
              habitEntities: habitEntities.build(),
              startDate: startDate,
              endDate: endDate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'habit';
        habit.build();
        _$failedField = 'habitEntities';
        habitEntities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HabitStat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
