// GENERATED CODE - DO NOT MODIFY BY HAND

part of creation_habit;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreationHabit> _$creationHabitSerializer =
    new _$CreationHabitSerializer();

class _$CreationHabitSerializer implements StructuredSerializer<CreationHabit> {
  @override
  final Iterable<Type> types = const [CreationHabit, _$CreationHabit];
  @override
  final String wireName = 'CreationHabit';

  @override
  Iterable<Object> serialize(Serializers serializers, CreationHabit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'lifeAreas',
      serializers.serialize(object.lifeAreas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  CreationHabit deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreationHabitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lifeAreas':
          result.lifeAreas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$CreationHabit extends CreationHabit {
  @override
  final String name;
  @override
  final int color;
  @override
  final BuiltList<int> lifeAreas;

  factory _$CreationHabit([void Function(CreationHabitBuilder) updates]) =>
      (new CreationHabitBuilder()..update(updates)).build();

  _$CreationHabit._({this.name, this.color, this.lifeAreas}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'name');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'color');
    }
    if (lifeAreas == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'lifeAreas');
    }
  }

  @override
  CreationHabit rebuild(void Function(CreationHabitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreationHabitBuilder toBuilder() => new CreationHabitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreationHabit &&
        name == other.name &&
        color == other.color &&
        lifeAreas == other.lifeAreas;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), color.hashCode), lifeAreas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreationHabit')
          ..add('name', name)
          ..add('color', color)
          ..add('lifeAreas', lifeAreas))
        .toString();
  }
}

class CreationHabitBuilder
    implements Builder<CreationHabit, CreationHabitBuilder> {
  _$CreationHabit _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  ListBuilder<int> _lifeAreas;
  ListBuilder<int> get lifeAreas =>
      _$this._lifeAreas ??= new ListBuilder<int>();
  set lifeAreas(ListBuilder<int> lifeAreas) => _$this._lifeAreas = lifeAreas;

  CreationHabitBuilder();

  CreationHabitBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _color = _$v.color;
      _lifeAreas = _$v.lifeAreas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreationHabit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreationHabit;
  }

  @override
  void update(void Function(CreationHabitBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreationHabit build() {
    _$CreationHabit _$result;
    try {
      _$result = _$v ??
          new _$CreationHabit._(
              name: name, color: color, lifeAreas: lifeAreas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lifeAreas';
        lifeAreas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreationHabit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
