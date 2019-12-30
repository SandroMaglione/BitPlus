import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_habit_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateHabitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create habit',
        rightAction: () => _saveHabit(context),
        rightIcon: Icons.save,
      ),
      body: ManageHabitView(),
    );
  }

  void _saveHabit(BuildContext context) {
    final String name = BlocProvider.of<CreationHabitBloc>(context).state.name;
    final areas = BlocProvider.of<CreationHabitBloc>(context).state.lifeAreas;
    final color =
        HABIT_COLORS[BlocProvider.of<CreationHabitBloc>(context).state.color]
            .value;

    BlocProvider.of<CreationHabitStatusBloc>(context).add(
      CreationHabitStatusEvent.creationHabitStatusCreateHabit(
        name: name,
        areas: areas,
        color: color,
      ),
    );
  }
}
