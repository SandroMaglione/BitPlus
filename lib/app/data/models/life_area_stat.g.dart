// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_area_stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LifeAreaStat> _$lifeAreaStatSerializer =
    new _$LifeAreaStatSerializer();

class _$LifeAreaStatSerializer implements StructuredSerializer<LifeAreaStat> {
  @override
  final Iterable<Type> types = const [LifeAreaStat, _$LifeAreaStat];
  @override
  final String wireName = 'LifeAreaStat';

  @override
  Iterable<Object> serialize(Serializers serializers, LifeAreaStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'lifeArea',
      serializers.serialize(object.lifeArea,
          specifiedType: const FullType(LifeArea)),
      'startDate',
      serializers.serialize(object.startDate,
          specifiedType: const FullType(DateTime)),
      'endDate',
      serializers.serialize(object.endDate,
          specifiedType: const FullType(DateTime)),
      'habitStats',
      serializers.serialize(object.habitStats,
          specifiedType:
              const FullType(BuiltList, const [const FullType(HabitStat)])),
    ];

    return result;
  }

  @override
  LifeAreaStat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LifeAreaStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lifeArea':
          result.lifeArea.replace(serializers.deserialize(value,
              specifiedType: const FullType(LifeArea)) as LifeArea);
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'habitStats':
          result.habitStats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HabitStat)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$LifeAreaStat extends LifeAreaStat {
  @override
  final LifeArea lifeArea;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final BuiltList<HabitStat> habitStats;

  factory _$LifeAreaStat([void Function(LifeAreaStatBuilder) updates]) =>
      (new LifeAreaStatBuilder()..update(updates)).build();

  _$LifeAreaStat._(
      {this.lifeArea, this.startDate, this.endDate, this.habitStats})
      : super._() {
    if (lifeArea == null) {
      throw new BuiltValueNullFieldError('LifeAreaStat', 'lifeArea');
    }
    if (startDate == null) {
      throw new BuiltValueNullFieldError('LifeAreaStat', 'startDate');
    }
    if (endDate == null) {
      throw new BuiltValueNullFieldError('LifeAreaStat', 'endDate');
    }
    if (habitStats == null) {
      throw new BuiltValueNullFieldError('LifeAreaStat', 'habitStats');
    }
  }

  @override
  LifeAreaStat rebuild(void Function(LifeAreaStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LifeAreaStatBuilder toBuilder() => new LifeAreaStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LifeAreaStat &&
        lifeArea == other.lifeArea &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        habitStats == other.habitStats;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, lifeArea.hashCode), startDate.hashCode),
            endDate.hashCode),
        habitStats.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LifeAreaStat')
          ..add('lifeArea', lifeArea)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('habitStats', habitStats))
        .toString();
  }
}

class LifeAreaStatBuilder
    implements Builder<LifeAreaStat, LifeAreaStatBuilder> {
  _$LifeAreaStat _$v;

  LifeAreaBuilder _lifeArea;
  LifeAreaBuilder get lifeArea => _$this._lifeArea ??= new LifeAreaBuilder();
  set lifeArea(LifeAreaBuilder lifeArea) => _$this._lifeArea = lifeArea;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  ListBuilder<HabitStat> _habitStats;
  ListBuilder<HabitStat> get habitStats =>
      _$this._habitStats ??= new ListBuilder<HabitStat>();
  set habitStats(ListBuilder<HabitStat> habitStats) =>
      _$this._habitStats = habitStats;

  LifeAreaStatBuilder();

  LifeAreaStatBuilder get _$this {
    if (_$v != null) {
      _lifeArea = _$v.lifeArea?.toBuilder();
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
      _habitStats = _$v.habitStats?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LifeAreaStat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LifeAreaStat;
  }

  @override
  void update(void Function(LifeAreaStatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LifeAreaStat build() {
    _$LifeAreaStat _$result;
    try {
      _$result = _$v ??
          new _$LifeAreaStat._(
              lifeArea: lifeArea.build(),
              startDate: startDate,
              endDate: endDate,
              habitStats: habitStats.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lifeArea';
        lifeArea.build();

        _$failedField = 'habitStats';
        habitStats.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LifeAreaStat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
