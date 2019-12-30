import 'package:auto_route/auto_route_annotations.dart';
import 'package:bitplus/app/presentation/screen/creation_habit_screen.dart';
import 'package:bitplus/app/presentation/screen/history_map_screen.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';
import 'package:bitplus/app/presentation/screen/init_life_area_screen.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/login_form_screen.dart';

@autoRouter
class $Router {
  @initial
  LoadingScreen loadingScreen;

  InitLifeAreaScreen initLifeAreaScreen;
  LoginFormScreen loginFormScreen;
  HomeScreen homeScreen;
  CreationHabitScreen creationHabitScreen;
  HistoryMapScreen historyMapScreen;
}
