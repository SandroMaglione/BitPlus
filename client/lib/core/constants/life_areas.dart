import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/life_area_setting.dart';
import 'package:built_collection/built_collection.dart';

BuiltList<LifeArea> LIFE_AREAS = BuiltList<LifeArea>(
  [
    LifeArea.fromSetting(
      LifeAreaSetting((l) => l
        ..name = 'love'
        ..icon = 'icon'
        ..color = 0xFFF40020),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'friendship'
          ..icon = 'icon'
          ..color = 0xFF001C84,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'adventures'
          ..icon = 'icon'
          ..color = 0xFF441C02,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'environment'
          ..icon = 'icon'
          ..color = 0xFFD7263D,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'health'
          ..icon = 'icon'
          ..color = 0xFFDB5ABA,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'intellectual'
          ..icon = 'icon'
          ..color = 0xFF177E89,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'skills'
          ..icon = 'icon'
          ..color = 0xFF000022,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'spiritual'
          ..icon = 'icon'
          ..color = 0xFFF94440,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'career'
          ..icon = 'icon'
          ..color = 0xFF00007C,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'creative'
          ..icon = 'icon'
          ..color = 0xFF0A6B2A,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'family'
          ..icon = 'icon'
          ..color = 0xFF0000C6,
      ),
    ),
    LifeArea.fromSetting(
      LifeAreaSetting(
        (l) => l
          ..name = 'community'
          ..icon = 'icon'
          ..color = 0xFF20BF55,
      ),
    ),
  ],
);
