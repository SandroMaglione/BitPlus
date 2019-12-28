import 'dart:math';

import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_tile.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
      builder: (context, state) => ListView.builder(
        itemCount: state.length,
        itemBuilder: (context, index) => AreaTile(
          area: state[index],
          percentageActivity: state[index].value /
              state
                  .map((a) => a.value)
                  .reduce((max, value) => value > max ? value : max),
          percentageArea: ((BlocProvider.of<AuthBloc>(context).state
                          as Authenticated)
                      .user
                      .areas[index] +
                  ((BlocProvider.of<AuthBloc>(context).state as Authenticated)
                          .user
                          .areas
                          .reduce((v1, v2) => v1 + v2)) /
                      (BlocProvider.of<AuthBloc>(context).state
                              as Authenticated)
                          .user
                          .areas
                          .length) /
              (BlocProvider.of<AuthBloc>(context).state as Authenticated)
                  .user
                  .areas
                  .reduce(max),
        ),
      ),
    );
  }
}
