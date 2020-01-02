// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/init_life_area_screen.dart';
import 'package:bitplus/app/presentation/screen/login_form_screen.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';
import 'package:bitplus/app/presentation/screen/creation_habit_screen.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/screen/history_map_screen.dart';
import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/presentation/screen/profile_screen.dart';
import 'package:bitplus/app/presentation/screen/update_life_area_screen.dart';

class Router {
  static const loadingScreen = '/';
  static const initLifeAreaScreen = '/initLifeAreaScreen';
  static const loginFormScreen = '/loginFormScreen';
  static const homeScreen = '/homeScreen';
  static const creationHabitScreen = '/creationHabitScreen';
  static const historyMapScreen = '/historyMapScreen';
  static const profileScreen = '/profileScreen';
  static const updateLifeAreaScreen = '/updateLifeAreaScreen';
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
      case loginFormScreen:
        if (hasInvalidArgs<List<int>>(args)) {
          return misTypedArgsRoute<List<int>>(args);
        }
        final typedArgs = args as List<int>;
        return MaterialPageRoute(
          builder: (_) => LoginFormScreen(typedArgs),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case creationHabitScreen:
        if (hasInvalidArgs<HabitApi>(args)) {
          return misTypedArgsRoute<HabitApi>(args);
        }
        final typedArgs = args as HabitApi;
        return MaterialPageRoute(
          builder: (_) => CreationHabitScreen(habit: typedArgs),
          settings: settings,
        );
      case historyMapScreen:
        if (hasInvalidArgs<HistoryMapScreenArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<HistoryMapScreenArguments>(args);
        }
        final typedArgs = args as HistoryMapScreenArguments;
        return MaterialPageRoute(
          builder: (_) => HistoryMapScreen(
              history: typedArgs.history,
              name: typedArgs.name,
              areaIndex: typedArgs.areaIndex,
              color: typedArgs.color,
              habitHistory: typedArgs.habitHistory),
          settings: settings,
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
          settings: settings,
        );
      case updateLifeAreaScreen:
        if (hasInvalidArgs<List<int>>(args, isRequired: true)) {
          return misTypedArgsRoute<List<int>>(args);
        }
        final typedArgs = args as List<int>;
        return MaterialPageRoute(
          builder: (_) => UpdateLifeAreaScreen(areas: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//--------------------------------------------------------------------------
// Arguments holder classes
//---------------------------------------------------------------------------

//HistoryMapScreen arguments holder class
class HistoryMapScreenArguments {
  final List<int> history;
  final String name;
  final int areaIndex;
  final int color;
  final List<HistoryHabit> habitHistory;
  HistoryMapScreenArguments(
      {@required this.history,
      @required this.name,
      @required this.areaIndex,
      @required this.color,
      @required this.habitHistory});
}
