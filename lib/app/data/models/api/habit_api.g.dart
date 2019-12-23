// GENERATED CODE - DO NOT MODIFY BY HAND

part of habit_api;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HabitApi> _$habitApiSerializer = new _$HabitApiSerializer();

class _$HabitApiSerializer implements StructuredSerializer<HabitApi> {
  @override
  final Iterable<Type> types = const [HabitApi, _$HabitApi];
  @override
  final String wireName = 'HabitApi';

  @override
  Iterable<Object> serialize(Serializers serializers, HabitApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'habitID',
      serializers.serialize(object.habitID,
          specifiedType: const FullType(String)),
      'checked',
      serializers.serialize(object.checked,
          specifiedType: const FullType(bool)),
      'isPositive',
      serializers.serialize(object.isPositive,
          specifiedType: const FullType(bool)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HabitApi deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HabitApiBuilder();

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
        case 'checked':
          result.checked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isPositive':
          result.isPositive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'areas':
          result.areas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HabitApi extends HabitApi {
  @override
  final String habitID;
  @override
  final bool checked;
  @override
  final bool isPositive;
  @override
  final int color;
  @override
  final int value;
  @override
  final BuiltList<int> areas;
  @override
  final String name;

  factory _$HabitApi([void Function(HabitApiBuilder) updates]) =>
      (new HabitApiBuilder()..update(updates)).build();

  _$HabitApi._(
      {this.habitID,
      this.checked,
      this.isPositive,
      this.color,
      this.value,
      this.areas,
      this.name})
      : super._() {
    if (habitID == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'habitID');
    }
    if (checked == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'checked');
    }
    if (isPositive == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'isPositive');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'color');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'value');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'areas');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('HabitApi', 'name');
    }
  }

  @override
  HabitApi rebuild(void Function(HabitApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HabitApiBuilder toBuilder() => new HabitApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HabitApi &&
        habitID == other.habitID &&
        checked == other.checked &&
        isPositive == other.isPositive &&
        color == other.color &&
        value == other.value &&
        areas == other.areas &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, habitID.hashCode), checked.hashCode),
                        isPositive.hashCode),
                    color.hashCode),
                value.hashCode),
            areas.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HabitApi')
          ..add('habitID', habitID)
          ..add('checked', checked)
          ..add('isPositive', isPositive)
          ..add('color', color)
          ..add('value', value)
          ..add('areas', areas)
          ..add('name', name))
        .toString();
  }
}

class HabitApiBuilder implements Builder<HabitApi, HabitApiBuilder> {
  _$HabitApi _$v;

  String _habitID;
  String get habitID => _$this._habitID;
  set habitID(String habitID) => _$this._habitID = habitID;

  bool _checked;
  bool get checked => _$this._checked;
  set checked(bool checked) => _$this._checked = checked;

  bool _isPositive;
  bool get isPositive => _$this._isPositive;
  set isPositive(bool isPositive) => _$this._isPositive = isPositive;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  HabitApiBuilder();

  HabitApiBuilder get _$this {
    if (_$v != null) {
      _habitID = _$v.habitID;
      _checked = _$v.checked;
      _isPositive = _$v.isPositive;
      _color = _$v.color;
      _value = _$v.value;
      _areas = _$v.areas?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HabitApi other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HabitApi;
  }

  @override
  void update(void Function(HabitApiBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HabitApi build() {
    _$HabitApi _$result;
    try {
      _$result = _$v ??
          new _$HabitApi._(
              habitID: habitID,
              checked: checked,
              isPositive: isPositive,
              color: color,
              value: value,
              areas: areas.build(),
              name: name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HabitApi', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
