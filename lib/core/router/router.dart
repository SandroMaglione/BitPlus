import 'package:auto_route/auto_route_annotations.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/login_screen.dart';
import 'package:bitplus/app/presentation/screen/init_life_area_screen.dart';

@autoRouter
class $Router {
  @initial
  LoadingScreen loadingScreen;

  InitLifeAreaScreen initLifeAreaScreen;
  LoginScreen loginScreen;
  HomeScreen homeScreen;
}
