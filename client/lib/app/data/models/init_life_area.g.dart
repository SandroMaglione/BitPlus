// GENERATED CODE - DO NOT MODIFY BY HAND

part of init_life_area;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitLifeArea> _$initLifeAreaSerializer =
    new _$InitLifeAreaSerializer();

class _$InitLifeAreaSerializer implements StructuredSerializer<InitLifeArea> {
  @override
  final Iterable<Type> types = const [InitLifeArea, _$InitLifeArea];
  @override
  final String wireName = 'InitLifeArea';

  @override
  Iterable<Object> serialize(Serializers serializers, InitLifeArea object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pointsLeft',
      serializers.serialize(object.pointsLeft,
          specifiedType: const FullType(int)),
      'values',
      serializers.serialize(object.values,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  InitLifeArea deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitLifeAreaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pointsLeft':
          result.pointsLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$InitLifeArea extends InitLifeArea {
  @override
  final int pointsLeft;
  @override
  final BuiltList<int> values;

  factory _$InitLifeArea([void Function(InitLifeAreaBuilder) updates]) =>
      (new InitLifeAreaBuilder()..update(updates)).build();

  _$InitLifeArea._({this.pointsLeft, this.values}) : super._() {
    if (pointsLeft == null) {
      throw new BuiltValueNullFieldError('InitLifeArea', 'pointsLeft');
    }
    if (values == null) {
      throw new BuiltValueNullFieldError('InitLifeArea', 'values');
    }
  }

  @override
  InitLifeArea rebuild(void Function(InitLifeAreaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitLifeAreaBuilder toBuilder() => new InitLifeAreaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitLifeArea &&
        pointsLeft == other.pointsLeft &&
        values == other.values;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pointsLeft.hashCode), values.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitLifeArea')
          ..add('pointsLeft', pointsLeft)
          ..add('values', values))
        .toString();
  }
}

class InitLifeAreaBuilder
    implements Builder<InitLifeArea, InitLifeAreaBuilder> {
  _$InitLifeArea _$v;

  int _pointsLeft;
  int get pointsLeft => _$this._pointsLeft;
  set pointsLeft(int pointsLeft) => _$this._pointsLeft = pointsLeft;

  ListBuilder<int> _values;
  ListBuilder<int> get values => _$this._values ??= new ListBuilder<int>();
  set values(ListBuilder<int> values) => _$this._values = values;

  InitLifeAreaBuilder();

  InitLifeAreaBuilder get _$this {
    if (_$v != null) {
      _pointsLeft = _$v.pointsLeft;
      _values = _$v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitLifeArea other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitLifeArea;
  }

  @override
  void update(void Function(InitLifeAreaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitLifeArea build() {
    _$InitLifeArea _$result;
    try {
      _$result = _$v ??
          new _$InitLifeArea._(pointsLeft: pointsLeft, values: values.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'values';
        values.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitLifeArea', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
