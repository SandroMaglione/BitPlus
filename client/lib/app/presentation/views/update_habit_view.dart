import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_habit_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateHabitView extends StatelessWidget {
  final Habit habit;

  const UpdateHabitView(
    this.habit,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Update habit',
        subtitle: '${habit.name}',
        rightAction: () => _updateHabit(context),
        rightIcon: Icons.save,
      ),
      body: ManageHabitView(),
    );
  }

  void _updateHabit(BuildContext context) {
    final String name = BlocProvider.of<CreationHabitBloc>(context).state.name;
    final areas = BlocProvider.of<CreationHabitBloc>(context).state.lifeAreas;
    final color =
        HABIT_COLORS[BlocProvider.of<CreationHabitBloc>(context).state.color]
            .value;

    BlocProvider.of<CreationHabitStatusBloc>(context).add(
      CreationHabitStatusEvent.creationHabitStatusUpdateHabit(
        habitID: habit.habitID,
        name: name,
        color: color,
        areas: areas,
        checked: habit.checked,
        streak: habit.streak,
        countChecks: habit.countChecks,
        history: habit.history,
      ),
    );
  }
}
