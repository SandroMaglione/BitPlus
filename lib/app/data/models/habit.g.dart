// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

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
      'isPositive',
      serializers.serialize(object.isPositive,
          specifiedType: const FullType(bool)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'lifeAreas',
      serializers.serialize(object.lifeAreas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
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
        case 'isPositive':
          result.isPositive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lifeAreas':
          result.lifeAreas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final bool isPositive;
  @override
  final int value;
  @override
  final BuiltList<int> lifeAreas;
  @override
  final int color;

  factory _$Habit([void Function(HabitBuilder) updates]) =>
      (new HabitBuilder()..update(updates)).build();

  _$Habit._(
      {this.habitID,
      this.name,
      this.isPositive,
      this.value,
      this.lifeAreas,
      this.color})
      : super._() {
    if (habitID == null) {
      throw new BuiltValueNullFieldError('Habit', 'habitID');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Habit', 'name');
    }
    if (isPositive == null) {
      throw new BuiltValueNullFieldError('Habit', 'isPositive');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('Habit', 'value');
    }
    if (lifeAreas == null) {
      throw new BuiltValueNullFieldError('Habit', 'lifeAreas');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('Habit', 'color');
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
        isPositive == other.isPositive &&
        value == other.value &&
        lifeAreas == other.lifeAreas &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, habitID.hashCode), name.hashCode),
                    isPositive.hashCode),
                value.hashCode),
            lifeAreas.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Habit')
          ..add('habitID', habitID)
          ..add('name', name)
          ..add('isPositive', isPositive)
          ..add('value', value)
          ..add('lifeAreas', lifeAreas)
          ..add('color', color))
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

  bool _isPositive;
  bool get isPositive => _$this._isPositive;
  set isPositive(bool isPositive) => _$this._isPositive = isPositive;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  ListBuilder<int> _lifeAreas;
  ListBuilder<int> get lifeAreas =>
      _$this._lifeAreas ??= new ListBuilder<int>();
  set lifeAreas(ListBuilder<int> lifeAreas) => _$this._lifeAreas = lifeAreas;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  HabitBuilder();

  HabitBuilder get _$this {
    if (_$v != null) {
      _habitID = _$v.habitID;
      _name = _$v.name;
      _isPositive = _$v.isPositive;
      _value = _$v.value;
      _lifeAreas = _$v.lifeAreas?.toBuilder();
      _color = _$v.color;
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
              isPositive: isPositive,
              value: value,
              lifeAreas: lifeAreas.build(),
              color: color);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lifeAreas';
        lifeAreas.build();
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
