// GENERATED CODE - DO NOT MODIFY BY HAND

part of create_habit_req;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateHabitReq> _$createHabitReqSerializer =
    new _$CreateHabitReqSerializer();

class _$CreateHabitReqSerializer
    implements StructuredSerializer<CreateHabitReq> {
  @override
  final Iterable<Type> types = const [CreateHabitReq, _$CreateHabitReq];
  @override
  final String wireName = 'CreateHabitReq';

  @override
  Iterable<Object> serialize(Serializers serializers, CreateHabitReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
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
    ];

    return result;
  }

  @override
  CreateHabitReq deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateHabitReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
      }
    }

    return result.build();
  }
}

class _$CreateHabitReq extends CreateHabitReq {
  @override
  final String uid;
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

  factory _$CreateHabitReq([void Function(CreateHabitReqBuilder) updates]) =>
      (new CreateHabitReqBuilder()..update(updates)).build();

  _$CreateHabitReq._(
      {this.uid,
      this.color,
      this.name,
      this.isPositive,
      this.value,
      this.areas})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'uid');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'color');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'name');
    }
    if (isPositive == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'isPositive');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'value');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('CreateHabitReq', 'areas');
    }
  }

  @override
  CreateHabitReq rebuild(void Function(CreateHabitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateHabitReqBuilder toBuilder() =>
      new CreateHabitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateHabitReq &&
        uid == other.uid &&
        color == other.color &&
        name == other.name &&
        isPositive == other.isPositive &&
        value == other.value &&
        areas == other.areas;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, uid.hashCode), color.hashCode), name.hashCode),
                isPositive.hashCode),
            value.hashCode),
        areas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateHabitReq')
          ..add('uid', uid)
          ..add('color', color)
          ..add('name', name)
          ..add('isPositive', isPositive)
          ..add('value', value)
          ..add('areas', areas))
        .toString();
  }
}

class CreateHabitReqBuilder
    implements Builder<CreateHabitReq, CreateHabitReqBuilder> {
  _$CreateHabitReq _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

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

  CreateHabitReqBuilder();

  CreateHabitReqBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _color = _$v.color;
      _name = _$v.name;
      _isPositive = _$v.isPositive;
      _value = _$v.value;
      _areas = _$v.areas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateHabitReq other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreateHabitReq;
  }

  @override
  void update(void Function(CreateHabitReqBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateHabitReq build() {
    _$CreateHabitReq _$result;
    try {
      _$result = _$v ??
          new _$CreateHabitReq._(
              uid: uid,
              color: color,
              name: name,
              isPositive: isPositive,
              value: value,
              areas: areas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreateHabitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
