import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/habit_tile.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<HabitListStatusBloc>(context).add(
      HabitListStatusEvent.habitListStatusGetHabitList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title:
              '${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.outlined_flag,
              ),
              onPressed: () => _signOut(context),
            ),
            IconButton(
              icon: Icon(
                Icons.list,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Router.areaOverviewScreen,
                  arguments:
                      BlocProvider.of<HabitListBloc>(context).state.toList(),
                );
              },
            ),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthUnauthenticated) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Router.loginScreen,
                    (_) => false,
                  );
                }
              },
            ),
          ],
          child: SafeArea(
            child: Column(
              children: <Widget>[
                BlocBuilder<HabitListStatusBloc, HabitListStatusState>(
                  builder: (context, state) =>
                      _buildHabitListStatusBloc(context, state),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () {
            Navigator.of(context).pushNamed(
              Router.createHabitScreen,
            );
          },
        ),
      ),
    );
  }

  Widget _buildHabitListStatusBloc(
      BuildContext context, HabitListStatusState state) {
    return state.when(
      habitListStatusInitial: (_) => LoadingIndicator(
        message: 'Initializing habits...',
      ),
      habitListStatusLoading: (_) => LoadingIndicator(
        message: 'Loading habits...',
      ),
      habitListStatusFailure: (state) => Center(
        child: Text('Error: ${state.message}'),
      ),
      habitListStatusSuccess: (_) =>
          BlocBuilder<HabitListBloc, BuiltList<HabitApi>>(
        builder: (context, state) => Expanded(
          child: state.isEmpty
              ? Text('No habit yet created')
              : ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) => HabitTile(
                    habit: state[index],
                  ),
                ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.authSignOut(),
    );
  }
}
