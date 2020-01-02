import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
      builder: (context, state) => PageView.builder(
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.77,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
          ),
          child: AreaPage(
            area: state[index],
            areaIndex: index,
          ),
        ),
        itemCount: state.length,
      ),
    );
  }
}
