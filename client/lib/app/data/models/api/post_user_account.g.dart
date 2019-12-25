// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_account;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostUserAccount> _$postUserAccountSerializer =
    new _$PostUserAccountSerializer();

class _$PostUserAccountSerializer
    implements StructuredSerializer<PostUserAccount> {
  @override
  final Iterable<Type> types = const [PostUserAccount, _$PostUserAccount];
  @override
  final String wireName = 'PostUserAccount';

  @override
  Iterable<Object> serialize(Serializers serializers, PostUserAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'areas',
      serializers.serialize(object.areas,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  PostUserAccount deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostUserAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
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

class _$PostUserAccount extends PostUserAccount {
  @override
  final String uid;
  @override
  final String email;
  @override
  final BuiltList<int> areas;

  factory _$PostUserAccount([void Function(PostUserAccountBuilder) updates]) =>
      (new PostUserAccountBuilder()..update(updates)).build();

  _$PostUserAccount._({this.uid, this.email, this.areas}) : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('PostUserAccount', 'uid');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('PostUserAccount', 'email');
    }
    if (areas == null) {
      throw new BuiltValueNullFieldError('PostUserAccount', 'areas');
    }
  }

  @override
  PostUserAccount rebuild(void Function(PostUserAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostUserAccountBuilder toBuilder() =>
      new PostUserAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostUserAccount &&
        uid == other.uid &&
        email == other.email &&
        areas == other.areas;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, uid.hashCode), email.hashCode), areas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostUserAccount')
          ..add('uid', uid)
          ..add('email', email)
          ..add('areas', areas))
        .toString();
  }
}

class PostUserAccountBuilder
    implements Builder<PostUserAccount, PostUserAccountBuilder> {
  _$PostUserAccount _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  ListBuilder<int> _areas;
  ListBuilder<int> get areas => _$this._areas ??= new ListBuilder<int>();
  set areas(ListBuilder<int> areas) => _$this._areas = areas;

  PostUserAccountBuilder();

  PostUserAccountBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _email = _$v.email;
      _areas = _$v.areas?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostUserAccount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostUserAccount;
  }

  @override
  void update(void Function(PostUserAccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostUserAccount build() {
    _$PostUserAccount _$result;
    try {
      _$result = _$v ??
          new _$PostUserAccount._(uid: uid, email: email, areas: areas.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'areas';
        areas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostUserAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
