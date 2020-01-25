// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_area_setting;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LifeAreaSetting> _$lifeAreaSettingSerializer =
    new _$LifeAreaSettingSerializer();

class _$LifeAreaSettingSerializer
    implements StructuredSerializer<LifeAreaSetting> {
  @override
  final Iterable<Type> types = const [LifeAreaSetting, _$LifeAreaSetting];
  @override
  final String wireName = 'LifeAreaSetting';

  @override
  Iterable<Object> serialize(Serializers serializers, LifeAreaSetting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'areaID',
      serializers.serialize(object.areaID, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  LifeAreaSetting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LifeAreaSettingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'areaID':
          result.areaID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$LifeAreaSetting extends LifeAreaSetting {
  @override
  final int areaID;
  @override
  final String name;
  @override
  final int color;

  factory _$LifeAreaSetting([void Function(LifeAreaSettingBuilder) updates]) =>
      (new LifeAreaSettingBuilder()..update(updates)).build();

  _$LifeAreaSetting._({this.areaID, this.name, this.color}) : super._() {
    if (areaID == null) {
      throw new BuiltValueNullFieldError('LifeAreaSetting', 'areaID');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('LifeAreaSetting', 'name');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('LifeAreaSetting', 'color');
    }
  }

  @override
  LifeAreaSetting rebuild(void Function(LifeAreaSettingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LifeAreaSettingBuilder toBuilder() =>
      new LifeAreaSettingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LifeAreaSetting &&
        areaID == other.areaID &&
        name == other.name &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, areaID.hashCode), name.hashCode), color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeAreaSetting')
          ..add('areaID', areaID)
          ..add('name', name)
          ..add('color', color))
        .toString();
  }
}

class LifeAreaSettingBuilder
    implements Builder<LifeAreaSetting, LifeAreaSettingBuilder> {
  _$LifeAreaSetting _$v;

  int _areaID;
  int get areaID => _$this._areaID;
  set areaID(int areaID) => _$this._areaID = areaID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  LifeAreaSettingBuilder();

  LifeAreaSettingBuilder get _$this {
    if (_$v != null) {
      _areaID = _$v.areaID;
      _name = _$v.name;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LifeAreaSetting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LifeAreaSetting;
  }

  @override
  void update(void Function(LifeAreaSettingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LifeAreaSetting build() {
    final _$result = _$v ??
        new _$LifeAreaSetting._(areaID: areaID, name: name, color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
