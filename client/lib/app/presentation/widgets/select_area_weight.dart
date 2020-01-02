import 'package:flutter/material.dart';

class SelectAreaWeight extends StatelessWidget {
  final String areaName;
  final int areaValue;
  final Color color;
  final double areaPercentage;
  final Function addValue;
  final Function subtractValue;

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
            shape: RoundedRectangleBorder(
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
                              areaName,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            child: Text(
                              '$areaValue points assigned',
                              style: TextStyle(
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
            builder: (ctx, cns) => AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: color,
              ),
              duration: Duration(
                milliseconds: 350,
              ),
              curve: Curves.easeOut,
              height: 4.0,
              width: cns.maxWidth * areaPercentage >= 0
                  ? cns.maxWidth * areaPercentage
                  : 0,
            ),
          ),
        ],
      ),
    );
  }
}
