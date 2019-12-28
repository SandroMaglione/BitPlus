import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/habit_tile.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
}
