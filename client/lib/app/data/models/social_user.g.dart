// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SocialUser> _$socialUserSerializer = new _$SocialUserSerializer();

class _$SocialUserSerializer implements StructuredSerializer<SocialUser> {
  @override
  final Iterable<Type> types = const [SocialUser, _$SocialUser];
  @override
  final String wireName = 'SocialUser';

  @override
  Iterable<Object> serialize(Serializers serializers, SocialUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'lifeAreaStat',
      serializers.serialize(object.lifeAreaStat,
          specifiedType: const FullType(LifeAreaStat)),
    ];

    return result;
  }

  @override
  SocialUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SocialUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lifeAreaStat':
          result.lifeAreaStat.replace(serializers.deserialize(value,
              specifiedType: const FullType(LifeAreaStat)) as LifeAreaStat);
          break;
      }
    }

    return result.build();
  }
}

class _$SocialUser extends SocialUser {
  @override
  final User user;
  @override
  final String username;
  @override
  final LifeAreaStat lifeAreaStat;

  factory _$SocialUser([void Function(SocialUserBuilder) updates]) =>
      (new SocialUserBuilder()..update(updates)).build();

  _$SocialUser._({this.user, this.username, this.lifeAreaStat}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('SocialUser', 'user');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('SocialUser', 'username');
    }
    if (lifeAreaStat == null) {
      throw new BuiltValueNullFieldError('SocialUser', 'lifeAreaStat');
    }
  }

  @override
  SocialUser rebuild(void Function(SocialUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialUserBuilder toBuilder() => new SocialUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialUser &&
        user == other.user &&
        username == other.username &&
        lifeAreaStat == other.lifeAreaStat;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, user.hashCode), username.hashCode), lifeAreaStat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocialUser')
          ..add('user', user)
          ..add('username', username)
          ..add('lifeAreaStat', lifeAreaStat))
        .toString();
  }
}

class SocialUserBuilder implements Builder<SocialUser, SocialUserBuilder> {
  _$SocialUser _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  LifeAreaStatBuilder _lifeAreaStat;
  LifeAreaStatBuilder get lifeAreaStat =>
      _$this._lifeAreaStat ??= new LifeAreaStatBuilder();
  set lifeAreaStat(LifeAreaStatBuilder lifeAreaStat) =>
      _$this._lifeAreaStat = lifeAreaStat;

  SocialUserBuilder();

  SocialUserBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _username = _$v.username;
      _lifeAreaStat = _$v.lifeAreaStat?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SocialUser;
  }

  @override
  void update(void Function(SocialUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SocialUser build() {
    _$SocialUser _$result;
    try {
      _$result = _$v ??
          new _$SocialUser._(
              user: user.build(),
              username: username,
              lifeAreaStat: lifeAreaStat.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();

        _$failedField = 'lifeAreaStat';
        lifeAreaStat.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SocialUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
