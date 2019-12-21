// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/init_life_area_screen.dart';
import 'package:bitplus/app/presentation/screen/login_screen.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';

class Router {
  static const loadingScreen = '/';
  static const initLifeAreaScreen = '/initLifeAreaScreen';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loadingScreen:
        return MaterialPageRoute(
          builder: (_) => LoadingScreen(),
          settings: settings,
        );
      case initLifeAreaScreen:
        return MaterialPageRoute(
          builder: (_) => InitLifeAreaScreen(),
          settings: settings,
        );
      case loginScreen:
        if (hasInvalidArgs<List<int>>(args)) {
          return misTypedArgsRoute<List<int>>(args);
        }
        final typedArgs = args as List<int>;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(typedArgs),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
