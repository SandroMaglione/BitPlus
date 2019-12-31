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
      serializers.serialize(object.habit,
          specifiedType: const FullType(HabitApi)),
      'historyCheck',
      serializers.serialize(object.historyCheck,
          specifiedType: const FullType(HistoryCheck)),
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
              specifiedType: const FullType(HabitApi)) as HabitApi);
          break;
        case 'historyCheck':
          result.historyCheck.replace(serializers.deserialize(value,
              specifiedType: const FullType(HistoryCheck)) as HistoryCheck);
          break;
      }
    }

    return result.build();
  }
}

class _$HistoryHabit extends HistoryHabit {
  @override
  final HabitApi habit;
  @override
  final HistoryCheck historyCheck;

  factory _$HistoryHabit([void Function(HistoryHabitBuilder) updates]) =>
      (new HistoryHabitBuilder()..update(updates)).build();

  _$HistoryHabit._({this.habit, this.historyCheck}) : super._() {
    if (habit == null) {
      throw new BuiltValueNullFieldError('HistoryHabit', 'habit');
    }
    if (historyCheck == null) {
      throw new BuiltValueNullFieldError('HistoryHabit', 'historyCheck');
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
        historyCheck == other.historyCheck;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, habit.hashCode), historyCheck.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryHabit')
          ..add('habit', habit)
          ..add('historyCheck', historyCheck))
        .toString();
  }
}

class HistoryHabitBuilder
    implements Builder<HistoryHabit, HistoryHabitBuilder> {
  _$HistoryHabit _$v;

  HabitApiBuilder _habit;
  HabitApiBuilder get habit => _$this._habit ??= new HabitApiBuilder();
  set habit(HabitApiBuilder habit) => _$this._habit = habit;

  HistoryCheckBuilder _historyCheck;
  HistoryCheckBuilder get historyCheck =>
      _$this._historyCheck ??= new HistoryCheckBuilder();
  set historyCheck(HistoryCheckBuilder historyCheck) =>
      _$this._historyCheck = historyCheck;

  HistoryHabitBuilder();

  HistoryHabitBuilder get _$this {
    if (_$v != null) {
      _habit = _$v.habit?.toBuilder();
      _historyCheck = _$v.historyCheck?.toBuilder();
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
              habit: habit.build(), historyCheck: historyCheck.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'habit';
        habit.build();
        _$failedField = 'historyCheck';
        historyCheck.build();
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
