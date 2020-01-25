// GENERATED CODE - DO NOT MODIFY BY HAND

part of init_login_form;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitLoginForm> _$initLoginFormSerializer =
    new _$InitLoginFormSerializer();

class _$InitLoginFormSerializer implements StructuredSerializer<InitLoginForm> {
  @override
  final Iterable<Type> types = const [InitLoginForm, _$InitLoginForm];
  @override
  final String wireName = 'InitLoginForm';

  @override
  Iterable<Object> serialize(Serializers serializers, InitLoginForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isEmailValid',
      serializers.serialize(object.isEmailValid,
          specifiedType: const FullType(bool)),
      'isPasswordValid',
      serializers.serialize(object.isPasswordValid,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  InitLoginForm deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitLoginFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isEmailValid':
          result.isEmailValid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isPasswordValid':
          result.isPasswordValid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$InitLoginForm extends InitLoginForm {
  @override
  final bool isEmailValid;
  @override
  final bool isPasswordValid;

  factory _$InitLoginForm([void Function(InitLoginFormBuilder) updates]) =>
      (new InitLoginFormBuilder()..update(updates)).build();

  _$InitLoginForm._({this.isEmailValid, this.isPasswordValid}) : super._() {
    if (isEmailValid == null) {
      throw new BuiltValueNullFieldError('InitLoginForm', 'isEmailValid');
    }
    if (isPasswordValid == null) {
      throw new BuiltValueNullFieldError('InitLoginForm', 'isPasswordValid');
    }
  }

  @override
  InitLoginForm rebuild(void Function(InitLoginFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitLoginFormBuilder toBuilder() => new InitLoginFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitLoginForm &&
        isEmailValid == other.isEmailValid &&
        isPasswordValid == other.isPasswordValid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isEmailValid.hashCode), isPasswordValid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitLoginForm')
          ..add('isEmailValid', isEmailValid)
          ..add('isPasswordValid', isPasswordValid))
        .toString();
  }
}

class InitLoginFormBuilder
    implements Builder<InitLoginForm, InitLoginFormBuilder> {
  _$InitLoginForm _$v;

  bool _isEmailValid;
  bool get isEmailValid => _$this._isEmailValid;
  set isEmailValid(bool isEmailValid) => _$this._isEmailValid = isEmailValid;

  bool _isPasswordValid;
  bool get isPasswordValid => _$this._isPasswordValid;
  set isPasswordValid(bool isPasswordValid) =>
      _$this._isPasswordValid = isPasswordValid;

  InitLoginFormBuilder();

  InitLoginFormBuilder get _$this {
    if (_$v != null) {
      _isEmailValid = _$v.isEmailValid;
      _isPasswordValid = _$v.isPasswordValid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitLoginForm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitLoginForm;
  }

  @override
  void update(void Function(InitLoginFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitLoginForm build() {
    final _$result = _$v ??
        new _$InitLoginForm._(
            isEmailValid: isEmailValid, isPasswordValid: isPasswordValid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
