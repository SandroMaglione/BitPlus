import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
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
    BlocProvider.of<HabitBloc>(context).add(
      GetHabitListHabitEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BitPlus'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Text(
                '${(BlocProvider.of<AuthBloc>(context).state as Authenticated).user.email.toUpperCase().substring(0, 1)}'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call_missed_outgoing,
            ),
            onPressed: () => _signOut(context),
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
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) => _buildHabitBloc(context, state),
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
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: state.habits
                  .map(
                    (habit) => Card(
                      margin: const EdgeInsets.only(bottom: 24.0, top: 12.0),
                      elevation: 12.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: Stack(
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) => Container(
                                color: Color(habit.color).withOpacity(0.15),
                                height: 10,
                                width: constraints.maxWidth * habit.value / 21,
                              ),
                            ),
                            ListTile(
                              title: Text('${habit.name}'),
                              subtitle: Text('${habit.habitID}'),
                              trailing: InkWell(
                                onTap: () {
                                  if (habit.checked) {
                                    BlocProvider.of<HabitBloc>(context).add(
                                      UncheckHabitEvent(
                                        habitID: habit.habitID,
                                      ),
                                    );
                                  } else {
                                    BlocProvider.of<HabitBloc>(context).add(
                                      CheckHabitEvent(
                                        habitID: habit.habitID,
                                      ),
                                    );
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(habit.color),
                                  child: Icon(
                                    habit.checked ? Icons.check : Icons.cached,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.authSignOut(),
    );
  }
}
