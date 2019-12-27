import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SelectAreaWeight extends StatelessWidget {
  final int index;
  final int areaValue;
  final Function updateValue;

  const SelectAreaWeight({
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
                    milliseconds: 350,
                  ),
                  curve: Curves.easeInOut,
                  color: ACCENT_COLOR_LIGHT,
                  height: constraints.maxHeight * areaValue / MAX_AREA_VALUE,
                  width: constraints.maxWidth,
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${LIFE_AREAS[index].name}'),
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
