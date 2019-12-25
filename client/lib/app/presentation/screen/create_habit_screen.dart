import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/manage_habit_view.dart';
import 'package:bitplus/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateHabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreationHabitBloc>(
          create: (context) => serviceLocator<CreationHabitBloc>(),
        ),
        BlocProvider<CreationHabitStatusBloc>(
          create: (context) => serviceLocator<CreationHabitStatusBloc>(),
        ),
      ],
      child: ManageHabitView(
        action: _saveHabit,
        title: 'Create habit',
      ),
    );
  }

  void _saveHabit(BuildContext context) {
    final String name = BlocProvider.of<CreationHabitBloc>(context).state.name;
    final int value = BlocProvider.of<CreationHabitBloc>(context).state.value;
    final areas = BlocProvider.of<CreationHabitBloc>(context).state.lifeAreas;
    final isPositive =
        BlocProvider.of<CreationHabitBloc>(context).state.isPositive;

    BlocProvider.of<CreationHabitStatusBloc>(context).add(
      CreationHabitStatusEvent.creationHabitStatusCreateHabit(
        name: name,
        isPositive: isPositive,
        areas: areas,
        value: value,
      ),
    );
  }
}
