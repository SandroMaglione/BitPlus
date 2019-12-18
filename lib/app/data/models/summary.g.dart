// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Summary> _$summarySerializer = new _$SummarySerializer();

class _$SummarySerializer implements StructuredSerializer<Summary> {
  @override
  final Iterable<Type> types = const [Summary, _$Summary];
  @override
  final String wireName = 'Summary';

  @override
  Iterable<Object> serialize(Serializers serializers, Summary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'dayTag',
      serializers.serialize(object.dayTag, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Summary deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'dayTag':
          result.dayTag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Summary extends Summary {
  @override
  final String text;
  @override
  final DateTime date;
  @override
  final int dayTag;

  factory _$Summary([void Function(SummaryBuilder) updates]) =>
      (new SummaryBuilder()..update(updates)).build();

  _$Summary._({this.text, this.date, this.dayTag}) : super._() {
    if (text == null) {
      throw new BuiltValueNullFieldError('Summary', 'text');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Summary', 'date');
    }
    if (dayTag == null) {
      throw new BuiltValueNullFieldError('Summary', 'dayTag');
    }
  }

  @override
  Summary rebuild(void Function(SummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummaryBuilder toBuilder() => new SummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Summary &&
        text == other.text &&
        date == other.date &&
        dayTag == other.dayTag;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, text.hashCode), date.hashCode), dayTag.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Summary')
          ..add('text', text)
          ..add('date', date)
          ..add('dayTag', dayTag))
        .toString();
  }
}

class SummaryBuilder implements Builder<Summary, SummaryBuilder> {
  _$Summary _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  int _dayTag;
  int get dayTag => _$this._dayTag;
  set dayTag(int dayTag) => _$this._dayTag = dayTag;

  SummaryBuilder();

  SummaryBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _date = _$v.date;
      _dayTag = _$v.dayTag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Summary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Summary;
  }

  @override
  void update(void Function(SummaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Summary build() {
    final _$result =
        _$v ?? new _$Summary._(text: text, date: date, dayTag: dayTag);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
