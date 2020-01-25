import 'package:flutter/material.dart';
import 'package:bitplus/core/extensions/string_extension.dart';

/// Area weight selector
///
/// Used in [InitLifeAreaScreen] to assign weights to each area
class SelectAreaWeight extends StatelessWidget {
  final String areaName;

  /// Weight points assigned to the area
  final int areaValue;
  final Color color;
  final double areaPercentage;
  final void Function() addValue;
  final void Function() subtractValue;

  const SelectAreaWeight({
    @required this.areaName,
    @required this.areaValue,
    @required this.areaPercentage,
    @required this.addValue,
    @required this.subtractValue,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: subtractValue,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            child: Text(
                              areaName.capitalize,
                              style: TextStyle(
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            child: Text(
                              '$areaValue points assigned',
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: addValue,
                  ),
                ],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (ctx, constraints) => AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: color.withOpacity(0.54),
              ),
              duration: const Duration(
                milliseconds: 350,
              ),
              curve: Curves.easeOut,
              height: 4.0,
              width: constraints.maxWidth * areaPercentage,
            ),
          ),
        ],
      ),
    );
  }
}
