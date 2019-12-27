// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_area;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LifeArea> _$lifeAreaSerializer = new _$LifeAreaSerializer();

class _$LifeAreaSerializer implements StructuredSerializer<LifeArea> {
  @override
  final Iterable<Type> types = const [LifeArea, _$LifeArea];
  @override
  final String wireName = 'LifeArea';

  @override
  Iterable<Object> serialize(Serializers serializers, LifeArea object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(double)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LifeArea deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LifeAreaBuilder();

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
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LifeArea extends LifeArea {
  @override
  final String name;
  @override
  final double value;
  @override
  final String icon;

  factory _$LifeArea([void Function(LifeAreaBuilder) updates]) =>
      (new LifeAreaBuilder()..update(updates)).build();

  _$LifeArea._({this.name, this.value, this.icon}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'name');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'value');
    }
    if (icon == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'icon');
    }
  }

  @override
  LifeArea rebuild(void Function(LifeAreaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LifeAreaBuilder toBuilder() => new LifeAreaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LifeArea &&
        name == other.name &&
        value == other.value &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), value.hashCode), icon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeArea')
          ..add('name', name)
          ..add('value', value)
          ..add('icon', icon))
        .toString();
  }
}

class LifeAreaBuilder implements Builder<LifeArea, LifeAreaBuilder> {
  _$LifeArea _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  LifeAreaBuilder();

  LifeAreaBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _value = _$v.value;
      _icon = _$v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LifeArea other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LifeArea;
  }

  @override
  void update(void Function(LifeAreaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LifeArea build() {
    final _$result =
        _$v ?? new _$LifeArea._(name: name, value: value, icon: icon);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
