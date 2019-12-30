import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:flutter/material.dart';

class SelectAreaWeight extends StatelessWidget {
  final int index;
  final int areaValue;
  final Function addValue;
  final Function subtractValue;

  const SelectAreaWeight({
    @required this.index,
    @required this.areaValue,
    @required this.addValue,
    @required this.subtractValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _valueAreaColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_drop_up),
            onPressed: addValue,
          ),
          Text('${LIFE_AREAS[index].name}$areaValue'),
          // Text(
          //   '$areaValue',
          //   style: TextStyle(
          //     fontWeight: FontWeight.w900,
          //     fontSize: 42,
          //   ),
          // ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: subtractValue,
          ),
        ],
      ),
    );
  }

  Color get _valueAreaColor => areaValue == 0
      ? Colors.white
      : areaValue < 0
          ? Colors.redAccent.withOpacity(areaValue.abs() / MAX_AREA_VALUE)
          : Colors.greenAccent.withOpacity(areaValue / MAX_AREA_VALUE);
}
