import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/create_habit_view.dart';
import 'package:bitplus/app/presentation/views/update_habit_view.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationHabitScreen extends StatelessWidget {
  final HabitApi habit;

  const CreationHabitScreen({
    this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreationHabitBloc>(
          create: (context) => serviceLocator<CreationHabitBloc>()
            ..add(
              CreationHabitEvent.initializeHabitCreationHabitEvent(
                habit: habit,
              ),
            ),
        ),
        BlocProvider<CreationHabitStatusBloc>(
          create: (context) => serviceLocator<CreationHabitStatusBloc>(),
        ),
      ],
      child: SafeArea(
        child: habit != null ? UpdateHabitView(habit) : CreateHabitView(),
      ),
    );
  }
}
