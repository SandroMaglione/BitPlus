import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_status_page.g.dart';

class LoginStatusPage extends EnumClass {
  static const LoginStatusPage InitAreasView = _$InitAreasView;
  static const LoginStatusPage FormView = _$FormView;

  const LoginStatusPage._(String name) : super(name);

  static BuiltSet<LoginStatusPage> get values => _$values;
  static LoginStatusPage valueOf(String name) => _$valueOf(name);
  static Serializer<LoginStatusPage> get serializer =>
      _$loginStatusPageSerializer;
}
