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
            creationHabitStatusLoading: (_) => LoadingIndicator(
              message: 'Creating habit...',
            ),
            creationHabitStatusSuccess: (_) => Center(
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
                          TextInputField(
                            label: 'Name',
                            onChanged: (value) {
                              BlocProvider.of<CreationHabitBloc>(context).add(
                                UpdateNameCreationHabitEvent(
                                  name: value,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
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
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => SelectAreaWeight(
                          index: index,
                          areaValue: state.lifeAreas[index],
                          addValue: () {
                            BlocProvider.of<CreationHabitBloc>(context).add(
                              AddAreasCreationHabitEvent(
                                indexToUpdate: index,
                              ),
                            );
                          },
                          subtractValue: () {
                            BlocProvider.of<CreationHabitBloc>(context).add(
                              SubtractAreasCreationHabitEvent(
                                indexToUpdate: index,
                              ),
                            );
                          },
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
}
