import 'package:bitplus/app/data/models/life_area.dart';
import 'package:built_collection/built_collection.dart';

BuiltList<LifeArea> LIFE_AREAS = BuiltList<LifeArea>(
  [
    LifeArea(
      (l) => l
        ..name = 'love'
        ..icon = 'icon'
        ..color = 0xFFF40020
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'friendship'
        ..icon = 'icon'
        ..color = 0xFF001C84
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'adventures'
        ..icon = 'icon'
        ..color = 0xFF441C02
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'environment'
        ..icon = 'icon'
        ..color = 0xFFD7263D
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'health'
        ..icon = 'icon'
        ..color = 0xFFDB5ABA
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'intellectual'
        ..icon = 'icon'
        ..color = 0xFF177E89
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'skills'
        ..icon = 'icon'
        ..color = 0xFF000022
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'spiritual'
        ..icon = 'icon'
        ..color = 0xFFCBE896
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'career'
        ..icon = 'icon'
        ..color = 0xFF00007C
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'creative'
        ..icon = 'icon'
        ..color = 0xFF0A6B2A
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'family'
        ..icon = 'icon'
        ..color = 0xFF0000C6
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
    LifeArea(
      (l) => l
        ..name = 'community'
        ..icon = 'icon'
        ..color = 0xFF20BF55
        ..history = ListBuilder<int>()
        ..countChecks = 0
        ..value = 0,
    ),
  ],
);
