// GENERATED CODE - DO NOT MODIFY BY HAND

part of habit;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Habit> _$habitSerializer = new _$HabitSerializer();

class _$HabitSerializer implements StructuredSerializer<Habit> {
  @override
  final Iterable<Type> types = const [Habit, _$Habit];
  @override
  final String wireName = 'Habit';

  @override
  Iterable<Object> serialize(Serializers serializers, Habit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'habitID',
      serializers.serialize(object.habitID,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'checked',
      serializers.serialize(object.checked,
          specifiedType: const FullType(bool)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'streak',
      serializers.serialize(object.streak, specifiedType: const FullType(int)),
      'countChecks',
      serializers.serialize(object.countChecks,
          specifiedType: const FullType(int)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'history',
      serializers.serialize(object.history,
          specifiedType: const FullType(
              BuiltList, const [const FullType(HistoryDayCheck)])),
    ];

    return result;
  }

  @override
  Habit deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HabitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'habitID':
          result.habitID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checked':
          result.checked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'streak':
          result.streak = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'countChecks':
          result.countChecks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'areas':
          result.areas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HistoryDayCheck)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Habit extends Habit {
  @override
  final String habitID;
  @override
  final String name;
  @override
  final bool checked;
  @override
  final int color;
  @override
  final int streak;
  @override
  final int countChecks;
  @override
  final BuiltList<int> areas;
  @override
  final BuiltList<HistoryDayCheck> history;

  factory _$Habit([void Function(HabitBuilder) updates]) =>
      (new HabitBuilder()..update(updates)).build();

  _$Habit._(
      {this.habitID,
      this.name,
      this.checked,
      this.color,
      this.streak,
      this.countChecks,
      this.areas,
      this.history})
      : super._() {
    if (habitID == null) {
      throw new BuiltValueNullFieldError('Habit', 'habitID');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Habit', 'name');
    }
    if (checked == null) {
      throw new BuiltValueNullFieldError('Habit', 'checked');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('Habit', 'color');
    }
    if (streak == null) {
      throw new BuiltValueNullFieldError('Habit', 'streak');
    }
    if (countChecks == null) {
      throw new BuiltValueNullFieldError('Habit', 'countChecks');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('Habit', 'areas');
    }
    if (history == null) {
      throw new BuiltValueNullFieldError('Habit', 'history');
    }
  }

  @override
  Habit rebuild(void Function(HabitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HabitBuilder toBuilder() => new HabitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Habit &&
        habitID == other.habitID &&
        name == other.name &&
        checked == other.checked &&
        color == other.color &&
        streak == other.streak &&
        countChecks == other.countChecks &&
        areas == other.areas &&
        history == other.history;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, habitID.hashCode), name.hashCode),
                            checked.hashCode),
                        color.hashCode),
                    streak.hashCode),
                countChecks.hashCode),
            areas.hashCode),
        history.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Habit')
          ..add('habitID', habitID)
          ..add('name', name)
          ..add('checked', checked)
          ..add('color', color)
          ..add('streak', streak)
          ..add('countChecks', countChecks)
          ..add('areas', areas)
          ..add('history', history))
        .toString();
  }
}

class HabitBuilder implements Builder<Habit, HabitBuilder> {
  _$Habit _$v;

  String _habitID;
  String get habitID => _$this._habitID;
  set habitID(String habitID) => _$this._habitID = habitID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _checked;
  bool get checked => _$this._checked;
  set checked(bool checked) => _$this._checked = checked;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  int _streak;
  int get streak => _$this._streak;
  set streak(int streak) => _$this._streak = streak;

  int _countChecks;
  int get countChecks => _$this._countChecks;
  set countChecks(int countChecks) => _$this._countChecks = countChecks;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  ListBuilder<HistoryDayCheck> _history;
  ListBuilder<HistoryDayCheck> get history =>
      _$this._history ??= new ListBuilder<HistoryDayCheck>();
  set history(ListBuilder<HistoryDayCheck> history) =>
      _$this._history = history;

  HabitBuilder();

  HabitBuilder get _$this {
    if (_$v != null) {
      _habitID = _$v.habitID;
      _name = _$v.name;
      _checked = _$v.checked;
      _color = _$v.color;
      _streak = _$v.streak;
      _countChecks = _$v.countChecks;
      _areas = _$v.areas?.toBuilder();
      _history = _$v.history?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Habit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Habit;
  }

  @override
  void update(void Function(HabitBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Habit build() {
    _$Habit _$result;
    try {
      _$result = _$v ??
          new _$Habit._(
              habitID: habitID,
              name: name,
              checked: checked,
              color: color,
              streak: streak,
              countChecks: countChecks,
              areas: areas.build(),
              history: history.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
        _$failedField = 'history';
        history.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Habit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
