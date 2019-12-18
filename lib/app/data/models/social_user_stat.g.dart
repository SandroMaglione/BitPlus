// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SocialUserStat> _$socialUserStatSerializer =
    new _$SocialUserStatSerializer();

class _$SocialUserStatSerializer
    implements StructuredSerializer<SocialUserStat> {
  @override
  final Iterable<Type> types = const [SocialUserStat, _$SocialUserStat];
  @override
  final String wireName = 'SocialUserStat';

  @override
  Iterable<Object> serialize(Serializers serializers, SocialUserStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'socialUsers',
      serializers.serialize(object.socialUsers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SocialUser)])),
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
  SocialUserStat deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SocialUserStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'socialUsers':
          result.socialUsers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SocialUser)]))
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

class _$SocialUserStat extends SocialUserStat {
  @override
  final BuiltList<SocialUser> socialUsers;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  factory _$SocialUserStat([void Function(SocialUserStatBuilder) updates]) =>
      (new SocialUserStatBuilder()..update(updates)).build();

  _$SocialUserStat._({this.socialUsers, this.startDate, this.endDate})
      : super._() {
    if (socialUsers == null) {
      throw new BuiltValueNullFieldError('SocialUserStat', 'socialUsers');
    }
    if (startDate == null) {
      throw new BuiltValueNullFieldError('SocialUserStat', 'startDate');
    }
    if (endDate == null) {
      throw new BuiltValueNullFieldError('SocialUserStat', 'endDate');
    }
  }

  @override
  SocialUserStat rebuild(void Function(SocialUserStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialUserStatBuilder toBuilder() =>
      new SocialUserStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialUserStat &&
        socialUsers == other.socialUsers &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, socialUsers.hashCode), startDate.hashCode),
        endDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocialUserStat')
          ..add('socialUsers', socialUsers)
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class SocialUserStatBuilder
    implements Builder<SocialUserStat, SocialUserStatBuilder> {
  _$SocialUserStat _$v;

  ListBuilder<SocialUser> _socialUsers;
  ListBuilder<SocialUser> get socialUsers =>
      _$this._socialUsers ??= new ListBuilder<SocialUser>();
  set socialUsers(ListBuilder<SocialUser> socialUsers) =>
      _$this._socialUsers = socialUsers;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  SocialUserStatBuilder();

  SocialUserStatBuilder get _$this {
    if (_$v != null) {
      _socialUsers = _$v.socialUsers?.toBuilder();
      _startDate = _$v.startDate;
      _endDate = _$v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialUserStat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SocialUserStat;
  }

  @override
  void update(void Function(SocialUserStatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SocialUserStat build() {
    _$SocialUserStat _$result;
    try {
      _$result = _$v ??
          new _$SocialUserStat._(
              socialUsers: socialUsers.build(),
              startDate: startDate,
              endDate: endDate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'socialUsers';
        socialUsers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SocialUserStat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
