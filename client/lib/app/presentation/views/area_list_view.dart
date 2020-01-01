import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_tile.dart';
import 'package:bitplus/app/presentation/widgets/staggered_list_animation.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
      builder: (context, state) => StaggeredListAnimation(
        buildChild: (index) => AreaTile(
          area: state[index],
          areaIndex: index,
        ),
        itemCount: state.length,
      ),
    );
  }
}
