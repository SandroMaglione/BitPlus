// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummaryStat> _$summaryStatSerializer = new _$SummaryStatSerializer();

class _$SummaryStatSerializer implements StructuredSerializer<SummaryStat> {
  @override
  final Iterable<Type> types = const [SummaryStat, _$SummaryStat];
  @override
  final String wireName = 'SummaryStat';

  @override
  Iterable<Object> serialize(Serializers serializers, SummaryStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'summaries',
      serializers.serialize(object.summaries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Summary)])),
      'startDate',
      serializers.serialize(object.startDate,
          specifiedType: const FullType(DateTime)),
      'endDate',
      serializers.serialize(object.endDate,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  SummaryStat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummaryStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'summaries':
          result.summaries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Summary)]))
              as BuiltList<dynamic>);
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$SummaryStat extends SummaryStat {
  @override
  final BuiltList<Summary> summaries;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  factory _$SummaryStat([void Function(SummaryStatBuilder) updates]) =>
      (new SummaryStatBuilder()..update(updates)).build();

  _$SummaryStat._({this.summaries, this.startDate, this.endDate}) : super._() {
    if (summaries == null) {
      throw new BuiltValueNullFieldError('SummaryStat', 'summaries');
    }
    if (startDate == null) {
      throw new BuiltValueNullFieldError('SummaryStat', 'startDate');
    }
    if (endDate == null) {
      throw new BuiltValueNullFieldError('SummaryStat', 'endDate');
    }
  }

  @override
  SummaryStat rebuild(void Function(SummaryStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummaryStatBuilder toBuilder() => new SummaryStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummaryStat &&
        summaries == other.summaries &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, summaries.hashCode), startDate.hashCode), endDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SummaryStat')
          ..add('summaries', summaries)
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class SummaryStatBuilder implements Builder<SummaryStat, SummaryStatBuilder> {
  _$SummaryStat _$v;

  ListBuilder<Summary> _summaries;
  ListBuilder<Summary> get summaries =>
      _$this._summaries ??= new ListBuilder<Summary>();
  set summaries(ListBuilder<Summary> summaries) =>
      _$this._summaries = summaries;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  SummaryStatBuilder();

  SummaryStatBuilder get _$this {
    if (_$v != null) {
      _summaries = _$v.summaries?.toBuilder();
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummaryStat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SummaryStat;
  }

  @override
  void update(void Function(SummaryStatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SummaryStat build() {
    _$SummaryStat _$result;
    try {
      _$result = _$v ??
          new _$SummaryStat._(
              summaries: summaries.build(),
              startDate: startDate,
              endDate: endDate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'summaries';
        summaries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SummaryStat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
