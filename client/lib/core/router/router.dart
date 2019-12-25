import 'package:auto_route/auto_route_annotations.dart';
import 'package:bitplus/app/presentation/screen/create_habit_screen.dart';
import 'package:bitplus/app/presentation/screen/home_screen.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';
import 'package:bitplus/app/presentation/screen/login_screen.dart';
import 'package:bitplus/app/presentation/screen/update_habit_screen.dart';

@autoRouter
class $Router {
  @initial
  LoadingScreen loadingScreen;

  LoginScreen loginScreen;
  HomeScreen homeScreen;
  CreateHabitScreen createHabitScreen;
  UpdateHabitScreen updateHabitScreen;
}
