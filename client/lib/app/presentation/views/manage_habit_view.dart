import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/select_area_weight.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageHabitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreationHabitStatusBloc, CreationHabitStatusState>(
      listener: (context, state) {
        if (state is CreationHabitStatusSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<CreationHabitStatusBloc, CreationHabitStatusState>(
        builder: (context, state) {
          return state.when(
            creationHabitStatusLoading: (_) => const LoadingIndicator(
              message: 'Creating habit...',
            ),
            creationHabitStatusSuccess: (_) => const Center(
              child: Text('Success habit creation'),
            ),
            creationHabitStatusFailure: (state) => Center(
              child: Text('Error: ${state.message}'),
            ),
            creationHabitStatusInProgress: (_) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: BlocBuilder<CreationHabitBloc, CreationHabit>(
                builder: (context, state) => CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 24.0,
                            ),
                            child: TextInputField(
                              label: 'Name',
                              controller: TextEditingController(
                                text:
                                    BlocProvider.of<CreationHabitBloc>(context)
                                        .state
                                        .name,
                              ),
                              onChanged: (value) {
                                BlocProvider.of<CreationHabitBloc>(context).add(
                                  UpdateNameCreationHabitEvent(
                                    name: value,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 16.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CreationHabitBloc>(context).add(
                                UpdateColorCreationHabitEvent(
                                  color: index,
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: HABIT_COLORS[index],
                              child: BlocProvider.of<CreationHabitBloc>(context)
                                          .state
                                          .color ==
                                      index
                                  ? Icon(Icons.check)
                                  : null,
                            ),
                          ),
                        ),
                        childCount: HABIT_COLORS.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => SelectAreaWeight(
                          areaName: LIFE_AREAS[index].name,
                          color: state.lifeAreas[index] >= 0
                              ? Colors.blueAccent
                              : Colors.redAccent,
                          areaPercentage: state.lifeAreas[index].abs() / 4,
                          areaValue: state.lifeAreas[index],
                          addValue: () => _addAreaValue(context, index),
                          subtractValue: () =>
                              _subtractAreaValue(context, index),
                        ),
                        childCount: LIFE_AREAS.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _subtractAreaValue(BuildContext context, int index) {
    BlocProvider.of<CreationHabitBloc>(context).add(
      SubtractAreasCreationHabitEvent(
        indexToUpdate: index,
      ),
    );
  }

  void _addAreaValue(BuildContext context, int index) {
    BlocProvider.of<CreationHabitBloc>(context).add(
      AddAreasCreationHabitEvent(
        indexToUpdate: index,
      ),
    );
  }
}
