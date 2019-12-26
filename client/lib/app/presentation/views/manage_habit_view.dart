import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/select_area_weight.dart';
import 'package:bitplus/app/presentation/widgets/slide_action_tile.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:bitplus/core/constants/areas_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageHabitView extends StatelessWidget {
  final String title;
  final Function action;

  const ManageHabitView({
    @required this.action,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CreationHabitStatusBloc, CreationHabitStatusState>(
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
                padding: const EdgeInsets.all(16.0),
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
                            ToggleButtons(
                              children: SELECTABLE_VALUES
                                  .map(
                                    (val) => Text('$val'),
                                  )
                                  .toList(),
                              isSelected: state.valueSelected.toList(),
                              onPressed: (index) {
                                BlocProvider.of<CreationHabitBloc>(context).add(
                                  UpdateValueCreationHabitEvent(
                                    indexSelected: index,
                                  ),
                                );
                              },
                            ),
                            Checkbox(
                              value: state.isPositive,
                              onChanged: (value) {
                                BlocProvider.of<CreationHabitBloc>(context).add(
                                  UpdateIsPositiveCreationHabitEvent(
                                    isPositive: value,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => SelectAreaWeight(
                            index: index,
                            areaValue: state.lifeAreas[index],
                            updateValue: () {
                              BlocProvider.of<CreationHabitBloc>(context).add(
                                UpdateAreasCreationHabitEvent(
                                  indexToUpdate: index,
                                ),
                              );
                            },
                          ),
                          childCount: AREA_NAMES.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => action(context),
        child: Icon(Icons.store),
      ),
    );
  }
}
