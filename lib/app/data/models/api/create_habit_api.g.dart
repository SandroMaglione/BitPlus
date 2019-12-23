// GENERATED CODE - DO NOT MODIFY BY HAND

part of create_habit_api;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateHabitApi> _$createHabitApiSerializer =
    new _$CreateHabitApiSerializer();

class _$CreateHabitApiSerializer
    implements StructuredSerializer<CreateHabitApi> {
  @override
  final Iterable<Type> types = const [CreateHabitApi, _$CreateHabitApi];
  @override
  final String wireName = 'CreateHabitApi';

  @override
  Iterable<Object> serialize(Serializers serializers, CreateHabitApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'isPositive',
      serializers.serialize(object.isPositive,
          specifiedType: const FullType(bool)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'dateCreated',
      serializers.serialize(object.dateCreated,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  CreateHabitApi deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateHabitApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'areas':
          result.areas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateHabitApi extends CreateHabitApi {
  @override
  final int color;
  @override
  final String name;
  @override
  final bool isPositive;
  @override
  final int value;
  @override
  final BuiltList<int> areas;
  @override
  final DateTime dateCreated;

  factory _$CreateHabitApi([void Function(CreateHabitApiBuilder) updates]) =>
      (new CreateHabitApiBuilder()..update(updates)).build();

  _$CreateHabitApi._(
      {this.color,
      this.name,
      this.isPositive,
      this.value,
      this.areas,
      this.dateCreated})
      : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'color');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'name');
    }
    if (isPositive == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'isPositive');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'value');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'areas');
    }
    if (dateCreated == null) {
      throw new BuiltValueNullFieldError('CreateHabitApi', 'dateCreated');
    }
  }

  @override
  CreateHabitApi rebuild(void Function(CreateHabitApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateHabitApiBuilder toBuilder() =>
      new CreateHabitApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateHabitApi &&
        color == other.color &&
        name == other.name &&
        isPositive == other.isPositive &&
        value == other.value &&
        areas == other.areas &&
        dateCreated == other.dateCreated;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, color.hashCode), name.hashCode),
                    isPositive.hashCode),
                value.hashCode),
            areas.hashCode),
        dateCreated.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateHabitApi')
          ..add('color', color)
          ..add('name', name)
          ..add('isPositive', isPositive)
          ..add('value', value)
          ..add('areas', areas)
          ..add('dateCreated', dateCreated))
        .toString();
  }
}

class CreateHabitApiBuilder
    implements Builder<CreateHabitApi, CreateHabitApiBuilder> {
  _$CreateHabitApi _$v;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isPositive;
  bool get isPositive => _$this._isPositive;
  set isPositive(bool isPositive) => _$this._isPositive = isPositive;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  DateTime _dateCreated;
  DateTime get dateCreated => _$this._dateCreated;
  set dateCreated(DateTime dateCreated) => _$this._dateCreated = dateCreated;

  CreateHabitApiBuilder();

  CreateHabitApiBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _name = _$v.name;
      _isPositive = _$v.isPositive;
      _value = _$v.value;
      _areas = _$v.areas?.toBuilder();
      _dateCreated = _$v.dateCreated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateHabitApi other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreateHabitApi;
  }

  @override
  void update(void Function(CreateHabitApiBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateHabitApi build() {
    _$CreateHabitApi _$result;
    try {
      _$result = _$v ??
          new _$CreateHabitApi._(
              color: color,
              name: name,
              isPositive: isPositive,
              value: value,
              areas: areas.build(),
              dateCreated: dateCreated);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreateHabitApi', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
