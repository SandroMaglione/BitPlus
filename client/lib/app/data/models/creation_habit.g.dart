// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_habit.dart';

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
      'isPositive',
      serializers.serialize(object.isPositive,
          specifiedType: const FullType(bool)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'lifeAreas',
      serializers.serialize(object.lifeAreas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'valueSelectedIndex',
      serializers.serialize(object.valueSelectedIndex,
          specifiedType: const FullType(int)),
      'valueSelected',
      serializers.serialize(object.valueSelected,
          specifiedType:
              const FullType(BuiltList, const [const FullType(bool)])),
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
        case 'valueSelectedIndex':
          result.valueSelectedIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'valueSelected':
          result.valueSelected.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))
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
  final bool isPositive;
  @override
  final int value;
  @override
  final BuiltList<int> lifeAreas;
  @override
  final int valueSelectedIndex;
  @override
  final BuiltList<bool> valueSelected;

  factory _$CreationHabit([void Function(CreationHabitBuilder) updates]) =>
      (new CreationHabitBuilder()..update(updates)).build();

  _$CreationHabit._(
      {this.name,
      this.isPositive,
      this.value,
      this.lifeAreas,
      this.valueSelectedIndex,
      this.valueSelected})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'name');
    }
    if (isPositive == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'isPositive');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'value');
    }
    if (lifeAreas == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'lifeAreas');
    }
    if (valueSelectedIndex == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'valueSelectedIndex');
    }
    if (valueSelected == null) {
      throw new BuiltValueNullFieldError('CreationHabit', 'valueSelected');
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
        isPositive == other.isPositive &&
        value == other.value &&
        lifeAreas == other.lifeAreas &&
        valueSelectedIndex == other.valueSelectedIndex &&
        valueSelected == other.valueSelected;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), isPositive.hashCode),
                    value.hashCode),
                lifeAreas.hashCode),
            valueSelectedIndex.hashCode),
        valueSelected.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreationHabit')
          ..add('name', name)
          ..add('isPositive', isPositive)
          ..add('value', value)
          ..add('lifeAreas', lifeAreas)
          ..add('valueSelectedIndex', valueSelectedIndex)
          ..add('valueSelected', valueSelected))
        .toString();
  }
}

class CreationHabitBuilder
    implements Builder<CreationHabit, CreationHabitBuilder> {
  _$CreationHabit _$v;

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

  int _valueSelectedIndex;
  int get valueSelectedIndex => _$this._valueSelectedIndex;
  set valueSelectedIndex(int valueSelectedIndex) =>
      _$this._valueSelectedIndex = valueSelectedIndex;

  ListBuilder<bool> _valueSelected;
  ListBuilder<bool> get valueSelected =>
      _$this._valueSelected ??= new ListBuilder<bool>();
  set valueSelected(ListBuilder<bool> valueSelected) =>
      _$this._valueSelected = valueSelected;

  CreationHabitBuilder();

  CreationHabitBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isPositive = _$v.isPositive;
      _value = _$v.value;
      _lifeAreas = _$v.lifeAreas?.toBuilder();
      _valueSelectedIndex = _$v.valueSelectedIndex;
      _valueSelected = _$v.valueSelected?.toBuilder();
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
              name: name,
              isPositive: isPositive,
              value: value,
              lifeAreas: lifeAreas.build(),
              valueSelectedIndex: valueSelectedIndex,
              valueSelected: valueSelected.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lifeAreas';
        lifeAreas.build();

        _$failedField = 'valueSelected';
        valueSelected.build();
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
