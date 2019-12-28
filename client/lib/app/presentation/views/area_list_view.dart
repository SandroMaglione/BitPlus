import 'dart:math';

import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/injection_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
      builder: (context, state) => ListView.builder(
        itemCount: state.length,
        itemBuilder: (context, index) => AreaProgress(
          areaIndex: index,
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

class AreaProgress extends StatelessWidget {
  final LifeArea area;
  final double percentageActivity;
  final double percentageArea;
  final int areaIndex;

  const AreaProgress({
    @required this.areaIndex,
    @required this.area,
    @required this.percentageActivity,
    @required this.percentageArea,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Router.historyMapScreen,
          arguments: HistoryMapScreenArguments(
            history: area.history.toList(),
            name: area.name,
            color: area.color,
          ),
        );
      },
      child: Container(
        height: 80.0,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) => Container(
                color: percentageActivity > 0.5 && percentageArea > 0.5
                    ? Colors.greenAccent
                    : percentageActivity > 0.5 && percentageArea < 0.5
                        ? Colors.redAccent
                        : Colors.blueAccent,
                width: constraints.maxWidth * percentageActivity,
                height: 40.0,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Transform.translate(
                offset: Offset(0, 40.0),
                child: Container(
                  color: Colors.black12,
                  width: constraints.maxWidth * percentageArea,
                  height: 40.0,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(area.name),
                          Text(
                            '${(BlocProvider.of<AuthBloc>(context).state as Authenticated).user.areas[areaIndex]}',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Color(area.color),
                        child: Text(
                          'x${area.countChecks}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
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
