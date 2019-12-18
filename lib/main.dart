import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/injection_container.dart' as di;

const String APP_NAME = "BitPlus";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        title: APP_NAME,
        onGenerateRoute: Router.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      ),
    );
  }
}
