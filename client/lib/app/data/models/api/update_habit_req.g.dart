// GENERATED CODE - DO NOT MODIFY BY HAND

part of update_habit_req;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateHabitReq> _$updateHabitReqSerializer =
    new _$UpdateHabitReqSerializer();

class _$UpdateHabitReqSerializer
    implements StructuredSerializer<UpdateHabitReq> {
  @override
  final Iterable<Type> types = const [UpdateHabitReq, _$UpdateHabitReq];
  @override
  final String wireName = 'UpdateHabitReq';

  @override
  Iterable<Object> serialize(Serializers serializers, UpdateHabitReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'habitID',
      serializers.serialize(object.habitID,
          specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  UpdateHabitReq deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateHabitReqBuilder();

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
        case 'habitID':
          result.habitID = serializers.deserialize(value,
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

class _$UpdateHabitReq extends UpdateHabitReq {
  @override
  final String uid;
  @override
  final String habitID;
  @override
  final int color;
  @override
  final String name;
  @override
  final BuiltList<int> areas;

  factory _$UpdateHabitReq([void Function(UpdateHabitReqBuilder) updates]) =>
      (new UpdateHabitReqBuilder()..update(updates)).build();

  _$UpdateHabitReq._(
      {this.uid, this.habitID, this.color, this.name, this.areas})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('UpdateHabitReq', 'uid');
    }
    if (habitID == null) {
      throw new BuiltValueNullFieldError('UpdateHabitReq', 'habitID');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('UpdateHabitReq', 'color');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UpdateHabitReq', 'name');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('UpdateHabitReq', 'areas');
    }
  }

  @override
  UpdateHabitReq rebuild(void Function(UpdateHabitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateHabitReqBuilder toBuilder() =>
      new UpdateHabitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateHabitReq &&
        uid == other.uid &&
        habitID == other.habitID &&
        color == other.color &&
        name == other.name &&
        areas == other.areas;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid.hashCode), habitID.hashCode), color.hashCode),
            name.hashCode),
        areas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateHabitReq')
          ..add('uid', uid)
          ..add('habitID', habitID)
          ..add('color', color)
          ..add('name', name)
          ..add('areas', areas))
        .toString();
  }
}

class UpdateHabitReqBuilder
    implements Builder<UpdateHabitReq, UpdateHabitReqBuilder> {
  _$UpdateHabitReq _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _habitID;
  String get habitID => _$this._habitID;
  set habitID(String habitID) => _$this._habitID = habitID;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  UpdateHabitReqBuilder();

  UpdateHabitReqBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _habitID = _$v.habitID;
      _color = _$v.color;
      _name = _$v.name;
      _areas = _$v.areas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateHabitReq other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateHabitReq;
  }

  @override
  void update(void Function(UpdateHabitReqBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateHabitReq build() {
    _$UpdateHabitReq _$result;
    try {
      _$result = _$v ??
          new _$UpdateHabitReq._(
              uid: uid,
              habitID: habitID,
              color: color,
              name: name,
              areas: areas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UpdateHabitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
