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
      'areaSettings',
      serializers.serialize(object.areaSettings,
          specifiedType: const FullType(LifeAreaSetting)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(double)),
      'userWeight',
      serializers.serialize(object.userWeight,
          specifiedType: const FullType(int)),
      'countChecksPositive',
      serializers.serialize(object.countChecksPositive,
          specifiedType: const FullType(int)),
      'countChecksNegative',
      serializers.serialize(object.countChecksNegative,
          specifiedType: const FullType(int)),
      'percentageArea',
      serializers.serialize(object.percentageArea,
          specifiedType: const FullType(double)),
      'percentageActivity',
      serializers.serialize(object.percentageActivity,
          specifiedType: const FullType(double)),
      'history',
      serializers.serialize(object.history,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'historyHabit',
      serializers.serialize(object.historyHabit,
          specifiedType:
              const FullType(BuiltList, const [const FullType(HistoryHabit)])),
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
        case 'areaSettings':
          result.areaSettings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LifeAreaSetting))
              as LifeAreaSetting);
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'userWeight':
          result.userWeight = serializers.deserialize(value,
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
        case 'percentageArea':
          result.percentageArea = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'percentageActivity':
          result.percentageActivity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'historyHabit':
          result.historyHabit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HistoryHabit)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$LifeArea extends LifeArea {
  @override
  final LifeAreaSetting areaSettings;
  @override
  final double value;
  @override
  final int userWeight;
  @override
  final int countChecksPositive;
  @override
  final int countChecksNegative;
  @override
  final double percentageArea;
  @override
  final double percentageActivity;
  @override
  final BuiltList<int> history;
  @override
  final BuiltList<HistoryHabit> historyHabit;

  factory _$LifeArea([void Function(LifeAreaBuilder) updates]) =>
      (new LifeAreaBuilder()..update(updates)).build();

  _$LifeArea._(
      {this.areaSettings,
      this.value,
      this.userWeight,
      this.countChecksPositive,
      this.countChecksNegative,
      this.percentageArea,
      this.percentageActivity,
      this.history,
      this.historyHabit})
      : super._() {
    if (areaSettings == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'areaSettings');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'value');
    }
    if (userWeight == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'userWeight');
    }
    if (countChecksPositive == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'countChecksPositive');
    }
    if (countChecksNegative == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'countChecksNegative');
    }
    if (percentageArea == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'percentageArea');
    }
    if (percentageActivity == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'percentageActivity');
    }
    if (history == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'history');
    }
    if (historyHabit == null) {
      throw new BuiltValueNullFieldError('LifeArea', 'historyHabit');
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
        areaSettings == other.areaSettings &&
        value == other.value &&
        userWeight == other.userWeight &&
        countChecksPositive == other.countChecksPositive &&
        countChecksNegative == other.countChecksNegative &&
        percentageArea == other.percentageArea &&
        percentageActivity == other.percentageActivity &&
        history == other.history &&
        historyHabit == other.historyHabit;
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
                                $jc($jc(0, areaSettings.hashCode),
                                    value.hashCode),
                                userWeight.hashCode),
                            countChecksPositive.hashCode),
                        countChecksNegative.hashCode),
                    percentageArea.hashCode),
                percentageActivity.hashCode),
            history.hashCode),
        historyHabit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeArea')
          ..add('areaSettings', areaSettings)
          ..add('value', value)
          ..add('userWeight', userWeight)
          ..add('countChecksPositive', countChecksPositive)
          ..add('countChecksNegative', countChecksNegative)
          ..add('percentageArea', percentageArea)
          ..add('percentageActivity', percentageActivity)
          ..add('history', history)
          ..add('historyHabit', historyHabit))
        .toString();
  }
}

class LifeAreaBuilder implements Builder<LifeArea, LifeAreaBuilder> {
  _$LifeArea _$v;

  LifeAreaSettingBuilder _areaSettings;
  LifeAreaSettingBuilder get areaSettings =>
      _$this._areaSettings ??= new LifeAreaSettingBuilder();
  set areaSettings(LifeAreaSettingBuilder areaSettings) =>
      _$this._areaSettings = areaSettings;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  int _userWeight;
  int get userWeight => _$this._userWeight;
  set userWeight(int userWeight) => _$this._userWeight = userWeight;

  int _countChecksPositive;
  int get countChecksPositive => _$this._countChecksPositive;
  set countChecksPositive(int countChecksPositive) =>
      _$this._countChecksPositive = countChecksPositive;

  int _countChecksNegative;
  int get countChecksNegative => _$this._countChecksNegative;
  set countChecksNegative(int countChecksNegative) =>
      _$this._countChecksNegative = countChecksNegative;

  double _percentageArea;
  double get percentageArea => _$this._percentageArea;
  set percentageArea(double percentageArea) =>
      _$this._percentageArea = percentageArea;

  double _percentageActivity;
  double get percentageActivity => _$this._percentageActivity;
  set percentageActivity(double percentageActivity) =>
      _$this._percentageActivity = percentageActivity;

  ListBuilder<int> _history;
  ListBuilder<int> get history => _$this._history ??= new ListBuilder<int>();
  set history(ListBuilder<int> history) => _$this._history = history;

  ListBuilder<HistoryHabit> _historyHabit;
  ListBuilder<HistoryHabit> get historyHabit =>
      _$this._historyHabit ??= new ListBuilder<HistoryHabit>();
  set historyHabit(ListBuilder<HistoryHabit> historyHabit) =>
      _$this._historyHabit = historyHabit;

  LifeAreaBuilder();

  LifeAreaBuilder get _$this {
    if (_$v != null) {
      _areaSettings = _$v.areaSettings?.toBuilder();
      _value = _$v.value;
      _userWeight = _$v.userWeight;
      _countChecksPositive = _$v.countChecksPositive;
      _countChecksNegative = _$v.countChecksNegative;
      _percentageArea = _$v.percentageArea;
      _percentageActivity = _$v.percentageActivity;
      _history = _$v.history?.toBuilder();
      _historyHabit = _$v.historyHabit?.toBuilder();
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
              areaSettings: areaSettings.build(),
              value: value,
              userWeight: userWeight,
              countChecksPositive: countChecksPositive,
              countChecksNegative: countChecksNegative,
              percentageArea: percentageArea,
              percentageActivity: percentageActivity,
              history: history.build(),
              historyHabit: historyHabit.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areaSettings';
        areaSettings.build();

        _$failedField = 'history';
        history.build();
        _$failedField = 'historyHabit';
        historyHabit.build();
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
