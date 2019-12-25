import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_habit_view.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateHabitScreen extends StatelessWidget {
  final HabitApi habit;

  const UpdateHabitScreen({
    @required this.habit,
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
      child: ManageHabitView(
        action: _updateHabit,
        title: '${habit.name}',
      ),
    );
  }

  void _updateHabit(BuildContext context) {
    final String name = BlocProvider.of<CreationHabitBloc>(context).state.name;
    final int value = BlocProvider.of<CreationHabitBloc>(context).state.value;
    final areas = BlocProvider.of<CreationHabitBloc>(context).state.lifeAreas;
    final isPositive =
        BlocProvider.of<CreationHabitBloc>(context).state.isPositive;

    BlocProvider.of<CreationHabitStatusBloc>(context).add(
      CreationHabitStatusEvent.creationHabitStatusUpdateHabit(
        habitID: habit.habitID,
        name: name,
        isPositive: isPositive,
        areas: areas,
        value: value,
        checked: habit.checked,
      ),
    );
  }
}
