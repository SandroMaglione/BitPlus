// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/login_screen.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';
import 'package:bitplus/app/presentation/screen/create_habit_screen.dart';
import 'package:bitplus/app/presentation/screen/update_habit_screen.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';

class Router {
  static const loadingScreen = '/';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const createHabitScreen = '/createHabitScreen';
  static const updateHabitScreen = '/updateHabitScreen';
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
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case createHabitScreen:
        return MaterialPageRoute(
          builder: (_) => CreateHabitScreen(),
          settings: settings,
        );
      case updateHabitScreen:
        if (hasInvalidArgs<HabitApi>(args, isRequired: true)) {
          return misTypedArgsRoute<HabitApi>(args);
        }
        final typedArgs = args as HabitApi;
        return MaterialPageRoute(
          builder: (_) => UpdateHabitScreen(habit: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}