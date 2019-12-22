import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HabitBloc>(
          create: (context) => serviceLocator<HabitBloc>()
            ..add(
              GetHabitListHabitEvent(),
            ),
        )
      ],
      child: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BitPlus'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call_missed_outgoing,
            ),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is EmptyUserState) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Router.initLifeAreaScreen,
                  (_) => false,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) => _buildHabitBloc(context, state),
        ),
      ),
    );
  }

  Widget _buildHabitBloc(BuildContext context, HabitState state) {
    return state.when(
      initialHabitState: (_) => LoadingIndicator(
        message: 'Initializing habits...',
      ),
      loadingHabitState: (_) => LoadingIndicator(
        message: 'Loading habits...',
      ),
      emptyHabitState: (_) => Text(
        'No habits found',
      ),
      errorHabitState: (state) => Text(
        '${state.message}',
      ),
      loadedHabitState: (state) {
        return Center(
          child: Column(
            children: state.habits
                .map(
                  (habit) => Text('$habit'),
                )
                .toList(),
          ),
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      SignOutUserEvent(),
    );
  }
}
