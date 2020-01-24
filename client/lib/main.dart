import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:bitplus/core/theme/theme.dart';
import 'package:bitplus/core/utils/simple_bloc_delegate.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/injection_container.dart' as di;
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

// TODO: Add check internet connection and relative Failure
const String APP_NAME = 'BitPlus';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  // TODO: Remove Crashlytics in dev mode someday!
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  // Status bar color
  await FlutterStatusbarcolor.setStatusBarColor(SCAFFOLD_COLOR);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

  di.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // Firebase analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.serviceLocator<AuthBloc>()
            ..add(
              AuthEvent.authOnStartup(),
            ),
        ),
        BlocProvider<HabitListBloc>(
          create: (context) => di.serviceLocator<HabitListBloc>(),
        ),
        BlocProvider<HabitListStatusBloc>(
          create: (context) => di.serviceLocator<HabitListStatusBloc>(),
        ),
        BlocProvider<AreaOverviewBloc>(
          create: (context) => di.serviceLocator<AreaOverviewBloc>(),
        ),
      ],
      child: MaterialApp(
        title: APP_NAME,
        navigatorObservers: <NavigatorObserver>[observer],
        onGenerateRoute: Router.onGenerateRoute,
        initialRoute: Router.loadingScreen,
        theme: themeData,
      ),
    );
  }
}
