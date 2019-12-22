// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userID',
      serializers.serialize(object.userID,
          specifiedType: const FullType(String)),
      'experience',
      serializers.serialize(object.experience,
          specifiedType: const FullType(int)),
      'level',
      serializers.serialize(object.level, specifiedType: const FullType(int)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$User extends User {
  @override
  final String userID;
  @override
  final int experience;
  @override
  final int level;
  @override
  final BuiltList<int> areas;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.userID, this.experience, this.level, this.areas}) : super._() {
    if (userID == null) {
      throw new BuiltValueNullFieldError('User', 'userID');
    }
    if (experience == null) {
      throw new BuiltValueNullFieldError('User', 'experience');
    }
    if (level == null) {
      throw new BuiltValueNullFieldError('User', 'level');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('User', 'areas');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        userID == other.userID &&
        experience == other.experience &&
        level == other.level &&
        areas == other.areas;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userID.hashCode), experience.hashCode), level.hashCode),
        areas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('userID', userID)
          ..add('experience', experience)
          ..add('level', level)
          ..add('areas', areas))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _userID;
  String get userID => _$this._userID;
  set userID(String userID) => _$this._userID = userID;

  int _experience;
  int get experience => _$this._experience;
  set experience(int experience) => _$this._experience = experience;

  int _level;
  int get level => _$this._level;
  set level(int level) => _$this._level = level;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _userID = _$v.userID;
      _experience = _$v.experience;
      _level = _$v.level;
      _areas = _$v.areas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              userID: userID,
              experience: experience,
              level: level,
              areas: areas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
