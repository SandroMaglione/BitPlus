import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredListAnimation extends StatelessWidget {
  final int itemCount;
  final Widget Function(int index) buildChild;
  final Duration duration;
  final double offset;

  const StaggeredListAnimation({
    Key key,
    @required this.buildChild,
    @required this.itemCount,
    this.duration = const Duration(milliseconds: 425),
    this.offset = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: duration,
          child: SlideAnimation(
            verticalOffset: offset,
            child: FadeInAnimation(
              child: buildChild(index),
            ),
          ),
        ),
      ),
    );
  }
}
