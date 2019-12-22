// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignUpUser> _$signUpUserSerializer = new _$SignUpUserSerializer();

class _$SignUpUserSerializer implements StructuredSerializer<SignUpUser> {
  @override
  final Iterable<Type> types = const [SignUpUser, _$SignUpUser];
  @override
  final String wireName = 'SignUpUser';

  @override
  Iterable<Object> serialize(Serializers serializers, SignUpUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  SignUpUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignUpUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'areas':
          result.areas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$SignUpUser extends SignUpUser {
  @override
  final String email;
  @override
  final String password;
  @override
  final BuiltList<int> areas;

  factory _$SignUpUser([void Function(SignUpUserBuilder) updates]) =>
      (new SignUpUserBuilder()..update(updates)).build();

  _$SignUpUser._({this.email, this.password, this.areas}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('SignUpUser', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('SignUpUser', 'password');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('SignUpUser', 'areas');
    }
  }

  @override
  SignUpUser rebuild(void Function(SignUpUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpUserBuilder toBuilder() => new SignUpUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpUser &&
        email == other.email &&
        password == other.password &&
        areas == other.areas;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, email.hashCode), password.hashCode), areas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpUser')
          ..add('email', email)
          ..add('password', password)
          ..add('areas', areas))
        .toString();
  }
}

class SignUpUserBuilder implements Builder<SignUpUser, SignUpUserBuilder> {
  _$SignUpUser _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  SignUpUserBuilder();

  SignUpUserBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _areas = _$v.areas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpUser;
  }

  @override
  void update(void Function(SignUpUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpUser build() {
    _$SignUpUser _$result;
    try {
      _$result = _$v ??
          new _$SignUpUser._(
              email: email, password: password, areas: areas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SignUpUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
