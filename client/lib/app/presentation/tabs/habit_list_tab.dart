import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/habit_tile.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/staggered_list_animation.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BlocBuilder<HabitListStatusBloc, HabitListStatusState>(
          builder: (context, state) =>
              _buildHabitListStatusBloc(context, state),
        ),
      ],
    );
  }

  Widget _buildHabitListStatusBloc(
      BuildContext context, HabitListStatusState state) {
    return state.when(
      habitListStatusInitial: (_) => const LoadingIndicator(
        message: 'Initializing habits...',
      ),
      habitListStatusLoading: (_) => const LoadingIndicator(
        message: 'Loading habits...',
      ),
      habitListStatusFailure: (state) => Center(
        child: Text('Error: ${state.message}'),
      ),
      habitListStatusSuccess: (_) =>
          BlocBuilder<HabitListBloc, BuiltList<Habit>>(
        builder: (context, state) => Expanded(
          child: state.isEmpty
              ? const Text('No habit yet created')
              : StaggeredListAnimation(
                  buildChild: (index) => HabitTile(
                    habit: state[index],
                  ),
                  itemCount: state.length,
                ),
        ),
      ),
    );
  }
}
