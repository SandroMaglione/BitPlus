// GENERATED CODE - DO NOT MODIFY BY HAND

part of history_habit;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryHabit> _$historyHabitSerializer =
    new _$HistoryHabitSerializer();

class _$HistoryHabitSerializer implements StructuredSerializer<HistoryHabit> {
  @override
  final Iterable<Type> types = const [HistoryHabit, _$HistoryHabit];
  @override
  final String wireName = 'HistoryHabit';

  @override
  Iterable<Object> serialize(Serializers serializers, HistoryHabit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'habit',
      serializers.serialize(object.habit, specifiedType: const FullType(Habit)),
      'historyDayCheck',
      serializers.serialize(object.historyDayCheck,
          specifiedType: const FullType(HistoryDayCheck)),
    ];

    return result;
  }

  @override
  HistoryHabit deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryHabitBuilder();

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
        case 'historyDayCheck':
          result.historyDayCheck.replace(serializers.deserialize(value,
                  specifiedType: const FullType(HistoryDayCheck))
              as HistoryDayCheck);
          break;
      }
    }

    return result.build();
  }
}

class _$HistoryHabit extends HistoryHabit {
  @override
  final Habit habit;
  @override
  final HistoryDayCheck historyDayCheck;

  factory _$HistoryHabit([void Function(HistoryHabitBuilder) updates]) =>
      (new HistoryHabitBuilder()..update(updates)).build();

  _$HistoryHabit._({this.habit, this.historyDayCheck}) : super._() {
    if (habit == null) {
      throw new BuiltValueNullFieldError('HistoryHabit', 'habit');
    }
    if (historyDayCheck == null) {
      throw new BuiltValueNullFieldError('HistoryHabit', 'historyDayCheck');
    }
  }

  @override
  HistoryHabit rebuild(void Function(HistoryHabitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryHabitBuilder toBuilder() => new HistoryHabitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryHabit &&
        habit == other.habit &&
        historyDayCheck == other.historyDayCheck;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, habit.hashCode), historyDayCheck.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryHabit')
          ..add('habit', habit)
          ..add('historyDayCheck', historyDayCheck))
        .toString();
  }
}

class HistoryHabitBuilder
    implements Builder<HistoryHabit, HistoryHabitBuilder> {
  _$HistoryHabit _$v;

  HabitBuilder _habit;
  HabitBuilder get habit => _$this._habit ??= new HabitBuilder();
  set habit(HabitBuilder habit) => _$this._habit = habit;

  HistoryDayCheckBuilder _historyDayCheck;
  HistoryDayCheckBuilder get historyDayCheck =>
      _$this._historyDayCheck ??= new HistoryDayCheckBuilder();
  set historyDayCheck(HistoryDayCheckBuilder historyDayCheck) =>
      _$this._historyDayCheck = historyDayCheck;

  HistoryHabitBuilder();

  HistoryHabitBuilder get _$this {
    if (_$v != null) {
      _habit = _$v.habit?.toBuilder();
      _historyDayCheck = _$v.historyDayCheck?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryHabit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryHabit;
  }

  @override
  void update(void Function(HistoryHabitBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryHabit build() {
    _$HistoryHabit _$result;
    try {
      _$result = _$v ??
          new _$HistoryHabit._(
              habit: habit.build(), historyDayCheck: historyDayCheck.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'habit';
        habit.build();
        _$failedField = 'historyDayCheck';
        historyDayCheck.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HistoryHabit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
