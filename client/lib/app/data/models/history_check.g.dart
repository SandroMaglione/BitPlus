// GENERATED CODE - DO NOT MODIFY BY HAND

part of history_check;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryCheck> _$historyCheckSerializer =
    new _$HistoryCheckSerializer();

class _$HistoryCheckSerializer implements StructuredSerializer<HistoryCheck> {
  @override
  final Iterable<Type> types = const [HistoryCheck, _$HistoryCheck];
  @override
  final String wireName = 'HistoryCheck';

  @override
  Iterable<Object> serialize(Serializers serializers, HistoryCheck object,
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
  HistoryCheck deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryCheckBuilder();

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

class _$HistoryCheck extends HistoryCheck {
  @override
  final DateTime day;
  @override
  final bool isChecked;

  factory _$HistoryCheck([void Function(HistoryCheckBuilder) updates]) =>
      (new HistoryCheckBuilder()..update(updates)).build();

  _$HistoryCheck._({this.day, this.isChecked}) : super._() {
    if (day == null) {
      throw new BuiltValueNullFieldError('HistoryCheck', 'day');
    }
    if (isChecked == null) {
      throw new BuiltValueNullFieldError('HistoryCheck', 'isChecked');
    }
  }

  @override
  HistoryCheck rebuild(void Function(HistoryCheckBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryCheckBuilder toBuilder() => new HistoryCheckBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryCheck &&
        day == other.day &&
        isChecked == other.isChecked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, day.hashCode), isChecked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryCheck')
          ..add('day', day)
          ..add('isChecked', isChecked))
        .toString();
  }
}

class HistoryCheckBuilder
    implements Builder<HistoryCheck, HistoryCheckBuilder> {
  _$HistoryCheck _$v;

  DateTime _day;
  DateTime get day => _$this._day;
  set day(DateTime day) => _$this._day = day;

  bool _isChecked;
  bool get isChecked => _$this._isChecked;
  set isChecked(bool isChecked) => _$this._isChecked = isChecked;

  HistoryCheckBuilder();

  HistoryCheckBuilder get _$this {
    if (_$v != null) {
      _day = _$v.day;
      _isChecked = _$v.isChecked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryCheck other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryCheck;
  }

  @override
  void update(void Function(HistoryCheckBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryCheck build() {
    final _$result =
        _$v ?? new _$HistoryCheck._(day: day, isChecked: isChecked);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
