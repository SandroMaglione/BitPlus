import 'dart:math';

import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/select_area_weight.dart';
import 'package:bitplus/app/presentation/widgets/staggered_list_animation.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/app/data/models/init_life_area.dart';

class ManageLifeAreaView extends StatelessWidget {
  final Widget bottomMenu;

  const ManageLifeAreaView({
    Key key,
    @required this.bottomMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 24.0,
            bottom: 8.0,
          ),
          child: BlocBuilder<InitLifeAreaBloc, InitLifeArea>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: StaggeredListAnimation(
                      duration: const Duration(milliseconds: 1600),
                      offset: 300.0,
                      buildChild: (index) => SelectAreaWeight(
                        areaName: LIFE_AREAS[index].name,
                        color: ACCENT_COLOR.withOpacity(0.56),
                        areaPercentage: state.values[index] /
                            (state.values.reduce(max) != 0
                                ? state.values.reduce(max)
                                : 1),
                        areaValue: state.values[index],
                        addValue: () => _addPoint(context, index),
                        subtractValue: () => _removePoint(context, index),
                      ),
                      itemCount: LIFE_AREAS.length,
                    ),
                  ),
                  bottomMenu,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addPoint(BuildContext context, int index) {
    BlocProvider.of<InitLifeAreaBloc>(context).add(
      AddPointInitLifeAreaEvent(
        lifeAreaID: index,
      ),
    );
  }

  void _removePoint(BuildContext context, int index) {
    BlocProvider.of<InitLifeAreaBloc>(context).add(
      RemovePointInitLifeAreaEvent(
        lifeAreaID: index,
      ),
    );
  }
}
