// GENERATED CODE - DO NOT MODIFY BY HAND

part of history_day_check;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryDayCheck> _$historyDayCheckSerializer =
    new _$HistoryDayCheckSerializer();

class _$HistoryDayCheckSerializer
    implements StructuredSerializer<HistoryDayCheck> {
  @override
  final Iterable<Type> types = const [HistoryDayCheck, _$HistoryDayCheck];
  @override
  final String wireName = 'HistoryDayCheck';

  @override
  Iterable<Object> serialize(Serializers serializers, HistoryDayCheck object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'day',
      serializers.serialize(object.day,
          specifiedType: const FullType(DateTime)),
      'isChecked',
      serializers.serialize(object.isChecked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  HistoryDayCheck deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryDayCheckBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isChecked':
          result.isChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$HistoryDayCheck extends HistoryDayCheck {
  @override
  final DateTime day;
  @override
  final bool isChecked;

  factory _$HistoryDayCheck([void Function(HistoryDayCheckBuilder) updates]) =>
      (new HistoryDayCheckBuilder()..update(updates)).build();

  _$HistoryDayCheck._({this.day, this.isChecked}) : super._() {
    if (day == null) {
      throw new BuiltValueNullFieldError('HistoryDayCheck', 'day');
    }
    if (isChecked == null) {
      throw new BuiltValueNullFieldError('HistoryDayCheck', 'isChecked');
    }
  }

  @override
  HistoryDayCheck rebuild(void Function(HistoryDayCheckBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryDayCheckBuilder toBuilder() =>
      new HistoryDayCheckBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryDayCheck &&
        day == other.day &&
        isChecked == other.isChecked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, day.hashCode), isChecked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryDayCheck')
          ..add('day', day)
          ..add('isChecked', isChecked))
        .toString();
  }
}

class HistoryDayCheckBuilder
    implements Builder<HistoryDayCheck, HistoryDayCheckBuilder> {
  _$HistoryDayCheck _$v;

  DateTime _day;
  DateTime get day => _$this._day;
  set day(DateTime day) => _$this._day = day;

  bool _isChecked;
  bool get isChecked => _$this._isChecked;
  set isChecked(bool isChecked) => _$this._isChecked = isChecked;

  HistoryDayCheckBuilder();

  HistoryDayCheckBuilder get _$this {
    if (_$v != null) {
      _day = _$v.day;
      _isChecked = _$v.isChecked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryDayCheck other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryDayCheck;
  }

  @override
  void update(void Function(HistoryDayCheckBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryDayCheck build() {
    final _$result =
        _$v ?? new _$HistoryDayCheck._(day: day, isChecked: isChecked);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
