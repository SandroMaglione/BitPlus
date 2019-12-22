import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/loading_indicator.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:bitplus/core/constants/areas_names.dart';
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
        )
      ],
      child: CreateHabitContent(),
    );
  }
}

class CreateHabitContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create habit'),
      ),
      body: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          return state.when(
            initialHabitState: (_) => LoadingIndicator(
              message: 'Loading habits...',
            ),
            loadingHabitState: (_) => LoadingIndicator(
              message: 'Loading habits...',
            ),
            emptyHabitState: (_) => LoadingIndicator(
              message: 'Loading habits...',
            ),
            errorHabitState: (_) => Text('Error habit list'),
            loadedHabitState: (_) => Padding(
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
                        (context, index) {
                          return SelectAreaValue(
                            index: index,
                            areaValue: state.lifeAreas[index],
                            updateValue: () {
                              BlocProvider.of<CreationHabitBloc>(context).add(
                                UpdateAreasCreationHabitEvent(
                                  indexToUpdate: index,
                                ),
                              );
                            },
                          );
                        },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveHabit(context),
        child: Icon(Icons.store),
      ),
    );
  }

  void _saveHabit(BuildContext context) {
    final String name = BlocProvider.of<CreationHabitBloc>(context).state.name;
    final int value = BlocProvider.of<CreationHabitBloc>(context).state.value;
    final areas = BlocProvider.of<CreationHabitBloc>(context).state.lifeAreas;
    final isPositive =
        BlocProvider.of<CreationHabitBloc>(context).state.isPositive;

    // print(name);
    // print(value);
    // print(areas);
    // print(isPositive);

    BlocProvider.of<HabitBloc>(context).add(
      CreateHabitEvent(
        name: name,
        isPositive: isPositive,
        areas: areas,
        value: value,
      ),
    );

    Navigator.of(context).pop();
  }
}

class SelectAreaValue extends StatelessWidget {
  final int index;
  final int areaValue;
  final Function updateValue;

  const SelectAreaValue({
    @required this.index,
    @required this.areaValue,
    @required this.updateValue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: updateValue,
      child: Card(
        elevation: 16.0,
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedContainer(
                  duration: Duration(
                    milliseconds: 250,
                  ),
                  curve: Curves.easeOutQuad,
                  color: Colors.orangeAccent,
                  height: constraints.maxHeight * areaValue / 3,
                  width: constraints.maxWidth,
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${AREA_NAMES[index]}'),
                Text(
                  '$areaValue',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 42,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
