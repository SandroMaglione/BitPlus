import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/injection_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOverviewScreen extends StatelessWidget {
  final List<HabitApi> habitList;

  const AreaOverviewScreen({
    @required this.habitList,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AreaOverviewBloc>(
          create: (context) => serviceLocator<AreaOverviewBloc>()
            ..add(
              AreaOverviewEvent.areaOverviewInitialize(
                habitList: BuiltList<HabitApi>(habitList),
              ),
            ),
        ),
      ],
      child: AreaOverviewList(),
    );
  }
}

class AreaOverviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
        builder: (context, state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(state[index].name),
            subtitle: Text('${state[index].value} points'),
            trailing: Text(
                '${state[index].value / state.map((a) => a.value).reduce((max, value) => value > max ? value : max)}'),
          ),
        ),
      ),
    );
  }
}
