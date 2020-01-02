import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_life_area_view.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/update_life_area_bottom_menu.dart';
import 'package:bitplus/injection_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateLifeAreaScreen extends StatelessWidget {
  final List<int> areas;

  const UpdateLifeAreaScreen({
    @required this.areas,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateLifeAreaStatusBloc>(
          create: (context) => serviceLocator<UpdateLifeAreaStatusBloc>(),
        ),
        BlocProvider<InitLifeAreaBloc>(
          create: (context) => serviceLocator<InitLifeAreaBloc>()
            ..add(
              InitLifeAreaEvent.initializeInitLifeAreaEvent(
                areas: BuiltList<int>(areas),
                pointsLeft: 0,
              ),
            ),
        ),
      ],
      child: _UpdateLifeAreaContent(
        areas: areas,
      ),
    );
  }
}

class _UpdateLifeAreaContent extends StatelessWidget {
  final List<int> areas;

  const _UpdateLifeAreaContent({
    @required this.areas,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateLifeAreaStatusBloc, UpdateLifeAreaStatusState>(
      listener: (context, state) {
        if (state is UpdateLifeAreaStatusSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body:
              BlocBuilder<UpdateLifeAreaStatusBloc, UpdateLifeAreaStatusState>(
            builder: (context, state) {
              return state.when(
                updateLifeAreaStatusLoading: (_) => LoadingIndicator(
                  message: 'Updating areas...',
                ),
                updateLifeAreaStatusSuccess: (_) => LoadingIndicator(
                  message: 'Success',
                ),
                updateLifeAreaStatusFailure: (state) => LoadingIndicator(
                  message: '${state.message}',
                ),
                updateLifeAreaStatusInitial: (_) => ManageLifeAreaView(
                  bottomMenu: UpdateLifeAreaBottomMenu(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
