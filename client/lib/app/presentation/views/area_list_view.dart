import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_page.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AreaListView extends StatelessWidget {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.84,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaOverviewBloc, BuiltList<LifeArea>>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(
          bottom: 32.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _controller,
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
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: state.length,
              effect: ScrollingDotsEffect(
                activeDotColor: ACCENT_COLOR_LIGHT.withOpacity(0.54),
                activeDotScale: 0.6,
                dotHeight: 12.0,
                dotWidth: 12.0,
                spacing: 12.0,
                dotColor: SCAFFOLD_MATERIAL_COLOR[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
