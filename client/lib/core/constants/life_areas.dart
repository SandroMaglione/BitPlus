import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/life_area_setting.dart';
import 'package:built_collection/built_collection.dart';

BuiltList<LifeArea> LIFE_AREAS = BuiltList<LifeArea>(
  [
    LifeArea.fromSetting(
      LifeAreaSetting((l) => l
        ..areaID = 0
        ..name = 'love'
        ..color = 0xFFF40020),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 1
          ..name = 'friendship'
          ..color = 0xFF001C84,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 2
          ..name = 'adventures'
          ..color = 0xFF441C02,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 3
          ..name = 'environment'
          ..color = 0xFFD7263D,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 4
          ..name = 'health'
          ..color = 0xFFDB5ABA,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 5
          ..name = 'intellectual'
          ..color = 0xFF177E89,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 6
          ..name = 'skills'
          ..color = 0xFF000022,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 7
          ..name = 'spiritual'
          ..color = 0xFFF94440,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 8
          ..name = 'career'
          ..color = 0xFF00007C,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 9
          ..name = 'creative'
          ..color = 0xFF0A6B2A,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 10
          ..name = 'family'
          ..color = 0xFF0000C6,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..areaID = 11
          ..name = 'community'
          ..color = 0xFF20BF55,
      ),
    ),
  ],
);
