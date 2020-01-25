import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_life_area_view.dart';
import 'package:bitplus/app/presentation/widgets/init_life_area_bottom_menu.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Assign area weight for sign up
class InitLifeAreaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitLifeAreaBloc>(
          create: (context) => serviceLocator<InitLifeAreaBloc>(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: ManageLifeAreaView(
            bottomMenu: InitLifeAreaBottomMenu(),
          ),
        ),
      ),
    );
  }
}
