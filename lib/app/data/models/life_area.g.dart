// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_area.dart';

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
      'lifeAreaID',
      serializers.serialize(object.lifeAreaID,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'experience',
      serializers.serialize(object.experience,
          specifiedType: const FullType(int)),
      'habits',
      serializers.serialize(object.habits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Habit)])),
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
        case 'lifeAreaID':
          result.lifeAreaID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'habits':
          result.habits.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Habit)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$LifeArea extends LifeArea {
  @override
  final String lifeAreaID;
  @override
  final String name;
  @override
  final String icon;
  @override
  final int experience;
  @override
  final BuiltList<Habit> habits;

  factory _$LifeArea([void Function(LifeAreaBuilder) updates]) =>
      (new LifeAreaBuilder()..update(updates)).build();

  _$LifeArea._(
      {this.lifeAreaID, this.name, this.icon, this.experience, this.habits})
      : super._() {
    if (lifeAreaID == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'lifeAreaID');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'name');
    }
    if (icon == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'icon');
    }
    if (experience == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'experience');
    }
    if (habits == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'habits');
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
        lifeAreaID == other.lifeAreaID &&
        name == other.name &&
        icon == other.icon &&
        experience == other.experience &&
        habits == other.habits;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, lifeAreaID.hashCode), name.hashCode), icon.hashCode),
            experience.hashCode),
        habits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeArea')
          ..add('lifeAreaID', lifeAreaID)
          ..add('name', name)
          ..add('icon', icon)
          ..add('experience', experience)
          ..add('habits', habits))
        .toString();
  }
}

class LifeAreaBuilder implements Builder<LifeArea, LifeAreaBuilder> {
  _$LifeArea _$v;

  String _lifeAreaID;
  String get lifeAreaID => _$this._lifeAreaID;
  set lifeAreaID(String lifeAreaID) => _$this._lifeAreaID = lifeAreaID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  int _experience;
  int get experience => _$this._experience;
  set experience(int experience) => _$this._experience = experience;

  ListBuilder<Habit> _habits;
  ListBuilder<Habit> get habits => _$this._habits ??= new ListBuilder<Habit>();
  set habits(ListBuilder<Habit> habits) => _$this._habits = habits;

  LifeAreaBuilder();

  LifeAreaBuilder get _$this {
    if (_$v != null) {
      _lifeAreaID = _$v.lifeAreaID;
      _name = _$v.name;
      _icon = _$v.icon;
      _experience = _$v.experience;
      _habits = _$v.habits?.toBuilder();
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
    _$LifeArea _$result;
    try {
      _$result = _$v ??
          new _$LifeArea._(
              lifeAreaID: lifeAreaID,
              name: name,
              icon: icon,
              experience: experience,
              habits: habits.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'habits';
        habits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LifeArea', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
