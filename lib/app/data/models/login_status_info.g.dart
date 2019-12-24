// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_status_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginStatusInfo> _$loginStatusInfoSerializer =
    new _$LoginStatusInfoSerializer();

class _$LoginStatusInfoSerializer
    implements StructuredSerializer<LoginStatusInfo> {
  @override
  final Iterable<Type> types = const [LoginStatusInfo, _$LoginStatusInfo];
  @override
  final String wireName = 'LoginStatusInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginStatusInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isAreasCompleted',
      serializers.serialize(object.isAreasCompleted,
          specifiedType: const FullType(bool)),
      'isAreasValid',
      serializers.serialize(object.isAreasValid,
          specifiedType: const FullType(bool)),
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
  LoginStatusInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginStatusInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isAreasCompleted':
          result.isAreasCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isAreasValid':
          result.isAreasValid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
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

class _$LoginStatusInfo extends LoginStatusInfo {
  @override
  final bool isAreasCompleted;
  @override
  final bool isAreasValid;
  @override
  final bool isEmailValid;
  @override
  final bool isPasswordValid;

  factory _$LoginStatusInfo([void Function(LoginStatusInfoBuilder) updates]) =>
      (new LoginStatusInfoBuilder()..update(updates)).build();

  _$LoginStatusInfo._(
      {this.isAreasCompleted,
      this.isAreasValid,
      this.isEmailValid,
      this.isPasswordValid})
      : super._() {
    if (isAreasCompleted == null) {
      throw new BuiltValueNullFieldError('LoginStatusInfo', 'isAreasCompleted');
    }
    if (isAreasValid == null) {
      throw new BuiltValueNullFieldError('LoginStatusInfo', 'isAreasValid');
    }
    if (isEmailValid == null) {
      throw new BuiltValueNullFieldError('LoginStatusInfo', 'isEmailValid');
    }
    if (isPasswordValid == null) {
      throw new BuiltValueNullFieldError('LoginStatusInfo', 'isPasswordValid');
    }
  }

  @override
  LoginStatusInfo rebuild(void Function(LoginStatusInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStatusInfoBuilder toBuilder() =>
      new LoginStatusInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginStatusInfo &&
        isAreasCompleted == other.isAreasCompleted &&
        isAreasValid == other.isAreasValid &&
        isEmailValid == other.isEmailValid &&
        isPasswordValid == other.isPasswordValid;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isAreasCompleted.hashCode), isAreasValid.hashCode),
            isEmailValid.hashCode),
        isPasswordValid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginStatusInfo')
          ..add('isAreasCompleted', isAreasCompleted)
          ..add('isAreasValid', isAreasValid)
          ..add('isEmailValid', isEmailValid)
          ..add('isPasswordValid', isPasswordValid))
        .toString();
  }
}

class LoginStatusInfoBuilder
    implements Builder<LoginStatusInfo, LoginStatusInfoBuilder> {
  _$LoginStatusInfo _$v;

  bool _isAreasCompleted;
  bool get isAreasCompleted => _$this._isAreasCompleted;
  set isAreasCompleted(bool isAreasCompleted) =>
      _$this._isAreasCompleted = isAreasCompleted;

  bool _isAreasValid;
  bool get isAreasValid => _$this._isAreasValid;
  set isAreasValid(bool isAreasValid) => _$this._isAreasValid = isAreasValid;

  bool _isEmailValid;
  bool get isEmailValid => _$this._isEmailValid;
  set isEmailValid(bool isEmailValid) => _$this._isEmailValid = isEmailValid;

  bool _isPasswordValid;
  bool get isPasswordValid => _$this._isPasswordValid;
  set isPasswordValid(bool isPasswordValid) =>
      _$this._isPasswordValid = isPasswordValid;

  LoginStatusInfoBuilder();

  LoginStatusInfoBuilder get _$this {
    if (_$v != null) {
      _isAreasCompleted = _$v.isAreasCompleted;
      _isAreasValid = _$v.isAreasValid;
      _isEmailValid = _$v.isEmailValid;
      _isPasswordValid = _$v.isPasswordValid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginStatusInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginStatusInfo;
  }

  @override
  void update(void Function(LoginStatusInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginStatusInfo build() {
    final _$result = _$v ??
        new _$LoginStatusInfo._(
            isAreasCompleted: isAreasCompleted,
            isAreasValid: isAreasValid,
            isEmailValid: isEmailValid,
            isPasswordValid: isPasswordValid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
