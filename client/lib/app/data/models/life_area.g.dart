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
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'countChecksPositive',
      serializers.serialize(object.countChecksPositive,
          specifiedType: const FullType(int)),
      'countChecksNegative',
      serializers.serialize(object.countChecksNegative,
          specifiedType: const FullType(int)),
      'history',
      serializers.serialize(object.history,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'habitChecks',
      serializers.serialize(object.habitChecks,
          specifiedType:
              const FullType(BuiltList, const [const FullType(HistoryHabit)])),
      'percentageArea',
      serializers.serialize(object.percentageArea,
          specifiedType: const FullType(double)),
      'percentageActivity',
      serializers.serialize(object.percentageActivity,
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
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'countChecksPositive':
          result.countChecksPositive = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'countChecksNegative':
          result.countChecksNegative = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'habitChecks':
          result.habitChecks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HistoryHabit)]))
              as BuiltList<dynamic>);
          break;
        case 'percentageArea':
          result.percentageArea = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'percentageActivity':
          result.percentageActivity = serializers.deserialize(value,
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
  final int color;
  @override
  final int countChecksPositive;
  @override
  final int countChecksNegative;
  @override
  final BuiltList<int> history;
  @override
  final BuiltList<HistoryHabit> habitChecks;
  @override
  final double percentageArea;
  @override
  final double percentageActivity;
  @override
  final String icon;

  factory _$LifeArea([void Function(LifeAreaBuilder) updates]) =>
      (new LifeAreaBuilder()..update(updates)).build();

  _$LifeArea._(
      {this.name,
      this.value,
      this.color,
      this.countChecksPositive,
      this.countChecksNegative,
      this.history,
      this.habitChecks,
      this.percentageArea,
      this.percentageActivity,
      this.icon})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'name');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'value');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'color');
    }
    if (countChecksPositive == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'countChecksPositive');
    }
    if (countChecksNegative == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'countChecksNegative');
    }
    if (history == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'history');
    }
    if (habitChecks == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'habitChecks');
    }
    if (percentageArea == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'percentageArea');
    }
    if (percentageActivity == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'percentageActivity');
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
        color == other.color &&
        countChecksPositive == other.countChecksPositive &&
        countChecksNegative == other.countChecksNegative &&
        history == other.history &&
        habitChecks == other.habitChecks &&
        percentageArea == other.percentageArea &&
        percentageActivity == other.percentageActivity &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, name.hashCode), value.hashCode),
                                    color.hashCode),
                                countChecksPositive.hashCode),
                            countChecksNegative.hashCode),
                        history.hashCode),
                    habitChecks.hashCode),
                percentageArea.hashCode),
            percentageActivity.hashCode),
        icon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeArea')
          ..add('name', name)
          ..add('value', value)
          ..add('color', color)
          ..add('countChecksPositive', countChecksPositive)
          ..add('countChecksNegative', countChecksNegative)
          ..add('history', history)
          ..add('habitChecks', habitChecks)
          ..add('percentageArea', percentageArea)
          ..add('percentageActivity', percentageActivity)
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

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  int _countChecksPositive;
  int get countChecksPositive => _$this._countChecksPositive;
  set countChecksPositive(int countChecksPositive) =>
      _$this._countChecksPositive = countChecksPositive;

  int _countChecksNegative;
  int get countChecksNegative => _$this._countChecksNegative;
  set countChecksNegative(int countChecksNegative) =>
      _$this._countChecksNegative = countChecksNegative;

  ListBuilder<int> _history;
  ListBuilder<int> get history => _$this._history ??= new ListBuilder<int>();
  set history(ListBuilder<int> history) => _$this._history = history;

  ListBuilder<HistoryHabit> _habitChecks;
  ListBuilder<HistoryHabit> get habitChecks =>
      _$this._habitChecks ??= new ListBuilder<HistoryHabit>();
  set habitChecks(ListBuilder<HistoryHabit> habitChecks) =>
      _$this._habitChecks = habitChecks;

  double _percentageArea;
  double get percentageArea => _$this._percentageArea;
  set percentageArea(double percentageArea) =>
      _$this._percentageArea = percentageArea;

  double _percentageActivity;
  double get percentageActivity => _$this._percentageActivity;
  set percentageActivity(double percentageActivity) =>
      _$this._percentageActivity = percentageActivity;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  LifeAreaBuilder();

  LifeAreaBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _value = _$v.value;
      _color = _$v.color;
      _countChecksPositive = _$v.countChecksPositive;
      _countChecksNegative = _$v.countChecksNegative;
      _history = _$v.history?.toBuilder();
      _habitChecks = _$v.habitChecks?.toBuilder();
      _percentageArea = _$v.percentageArea;
      _percentageActivity = _$v.percentageActivity;
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
    _$LifeArea _$result;
    try {
      _$result = _$v ??
          new _$LifeArea._(
              name: name,
              value: value,
              color: color,
              countChecksPositive: countChecksPositive,
              countChecksNegative: countChecksNegative,
              history: history.build(),
              habitChecks: habitChecks.build(),
              percentageArea: percentageArea,
              percentageActivity: percentageActivity,
              icon: icon);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'history';
        history.build();
        _$failedField = 'habitChecks';
        habitChecks.build();
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
