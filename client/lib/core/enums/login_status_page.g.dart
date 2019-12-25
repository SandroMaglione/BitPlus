// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_status_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LoginStatusPage _$InitAreasView =
    const LoginStatusPage._('InitAreasView');
const LoginStatusPage _$FormView = const LoginStatusPage._('FormView');

LoginStatusPage _$valueOf(String name) {
  switch (name) {
    case 'InitAreasView':
      return _$InitAreasView;
    case 'FormView':
      return _$FormView;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LoginStatusPage> _$values =
    new BuiltSet<LoginStatusPage>(const <LoginStatusPage>[
  _$InitAreasView,
  _$FormView,
]);

Serializer<LoginStatusPage> _$loginStatusPageSerializer =
    new _$LoginStatusPageSerializer();

class _$LoginStatusPageSerializer
    implements PrimitiveSerializer<LoginStatusPage> {
  @override
  final Iterable<Type> types = const <Type>[LoginStatusPage];
  @override
  final String wireName = 'LoginStatusPage';

  @override
  Object serialize(Serializers serializers, LoginStatusPage object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  LoginStatusPage deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LoginStatusPage.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
