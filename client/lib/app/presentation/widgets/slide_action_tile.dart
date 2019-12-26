import 'package:flutter/material.dart';

class SlideActionTile extends StatefulWidget {
  /// Content of the tile
  final Widget child;

  /// Content displayed when slided from right to left
  ///
  /// Default is [Icon]
  final Widget rightContent;

  /// Content displayed when slided from left to right
  ///
  /// Default is [Icon]
  final Widget leftContent;

  /// Function called when tile slided from left to right
  ///
  /// Called only when slide amount in percentage on the
  /// width of the screen is greater than [triggerSlideAmount]
  final Function onSlideToRight;

  /// Function called when tile slided from right to left
  ///
  /// Called only when slide amount in percentage on the
  /// width of the screen is greater than [triggerSlideAmount]
  final Function onSlideToLeft;

  /// Duration of the transition when tile released
  ///
  /// Deafult time is [900] milliseconds
  final Duration animationDuration;

  /// Animation curve of the transition when tile released
  ///
  /// Default is [Curves.elasticOut]
  final Curve animationCurve;

  /// Percentage of overall screen width to slide
  /// before triggering the [onSlideToRight] or
  /// [onSlideToLeft] action
  ///
  /// Default is [0.25]% of the screen width
  final double triggerSlideAmount;

  const SlideActionTile({
    @required this.child,
    this.triggerSlideAmount = 0.25,
    this.leftContent,
    this.rightContent,
    this.onSlideToLeft,
    this.onSlideToRight,
    this.animationCurve = Curves.elasticOut,
    this.animationDuration = const Duration(
      milliseconds: 900,
    ),
  });

  @override
  _SlideActionTileState createState() => _SlideActionTileState();
}

/// Manages the [Animation] of the tile
class _SlideActionTileState extends State<SlideActionTile>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  Tween<double> _tween;
  AnimationController _animController;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    // Update animation duration and curve on rebuild
    _animController.duration = widget.animationDuration;
    _curvedAnimation.curve = widget.animationCurve;

    return SlideAnimationController(
      child: widget.child,
      animation: _animation,
      animationReset: _resetAnimation,
      leftContent: widget.leftContent,
      rightContent: widget.rightContent,
      onSlideToLeft: widget.onSlideToLeft,
      onSlideToRight: widget.onSlideToRight,
      triggerSlideAmount: widget.triggerSlideAmount,
    );
  }

  /// Initialize animation controller given input widget parameters
  void _initializeAnimation() {
    _animController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _animController,
      curve: widget.animationCurve,
    );

    _tween = Tween(
      begin: 0,
      end: 0,
    );

    _animation = _tween.animate(
      _curvedAnimation,
    );
  }

  /// Reset and repeat the animation every slide
  void _resetAnimation(double animationBegin) {
    _animController.reset();
    _tween.begin = animationBegin;
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }
}

/// Manages the gesture using a [GestureDetector]
class SlideAnimationController extends StatefulWidget {
  final Widget child;

  final Widget rightContent;
  final Widget leftContent;

  final Function onSlideToRight;
  final Function onSlideToLeft;

  final double triggerSlideAmount;

  final void Function(double animationBegin) animationReset;
  final Animation<double> animation;

  const SlideAnimationController({
    @required this.child,
    @required this.animationReset,
    @required this.animation,
    @required this.triggerSlideAmount,
    @required this.leftContent,
    @required this.rightContent,
    @required this.onSlideToLeft,
    @required this.onSlideToRight,
  });

  @override
  _SlideAnimationControllerState createState() =>
      _SlideAnimationControllerState();
}

class _SlideAnimationControllerState extends State<SlideAnimationController>
    with SingleTickerProviderStateMixin {
  double _startPress = 0;
  double _currentPress = 0;
  bool _isMoving = false;
  bool _isTriggeredOnLeft = false;
  bool _isTriggeredOnRight = false;

  double get translatePosition => _currentPress - _startPress;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragUpdate: (details) => _horizontalDragUpdate(
        details,
        w,
      ),
      onHorizontalDragStart: _horizontalDragStart,
      onHorizontalDragEnd: _horizontalDragEnd,
      child: AnimatedContent(
        child: widget.child,
        translatePosition: translatePosition,
        isTriggeredOnLeft: _isTriggeredOnLeft,
        isTriggeredOnRight: _isTriggeredOnRight,
        leftContent: widget.leftContent,
        rightContent: widget.rightContent,
        isMoving: _isMoving,
        animation: widget.animation,
      ),
    );
  }

  /// Trigger animation and actions
  ///
  /// Reset [_isTriggeredOnLeft], [_isTriggeredOnRight], and [_isMoving] to false
  void _horizontalDragEnd(DragEndDetails details) {
    widget.animationReset(translatePosition);
    _triggerSlideAction();

    setState(() {
      _isMoving = false;
      _isTriggeredOnLeft = false;
      _isTriggeredOnRight = false;
    });
  }

  /// Initialize [_startPress], and [_isMoving] true
  void _horizontalDragStart(DragStartDetails details) {
    setState(() {
      _startPress = details.localPosition.dx;
      _currentPress = details.localPosition.dx;
      _isMoving = true;
    });
  }

  /// Update position and check triggers
  void _horizontalDragUpdate(
    DragUpdateDetails details,
    double screenWidth,
  ) {
    setState(() {
      _currentPress = details.localPosition.dx;
      _isTriggeredOnRight =
          translatePosition > screenWidth * widget.triggerSlideAmount;
      _isTriggeredOnLeft =
          -translatePosition > screenWidth * widget.triggerSlideAmount;
    });
  }

  /// Call [onSlideToLeft] or [onSlideToRight] based if enough slide amount
  void _triggerSlideAction() {
    if (_isTriggeredOnLeft && widget.onSlideToLeft != null) {
      widget.onSlideToLeft();
    } else if (_isTriggeredOnRight && widget.onSlideToRight != null) {
      widget.onSlideToRight();
    }
  }
}

class AnimatedContent extends StatelessWidget {
  final double translatePosition;
  final bool isTriggeredOnLeft;
  final bool isTriggeredOnRight;
  final Widget child;
  final Widget rightContent;
  final Widget leftContent;
  final bool isMoving;
  final Animation<double> animation;

  const AnimatedContent({
    @required this.isTriggeredOnLeft,
    @required this.isTriggeredOnRight,
    @required this.translatePosition,
    @required this.child,
    @required this.isMoving,
    @required this.animation,
    @required this.rightContent,
    @required this.leftContent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        translatePosition > 0 ? onLeftContent : onRightContent,
        AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) => Transform.scale(
            scale: isMoving ? 1.05 : 1,
            child: Transform.translate(
              offset: Offset(
                isMoving ? translatePosition : animation.value,
                0,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  Widget get onLeftContent => Positioned(
        left: 42.0,
        child: Transform.scale(
          scale: isTriggeredOnRight ? 1.6 : 1,
          child: leftContent ??
              Icon(
                Icons.remove_circle_outline,
              ),
        ),
      );

  Widget get onRightContent => Positioned(
        right: 42.0,
        child: Transform.scale(
          scale: isTriggeredOnLeft ? 1.6 : 1,
          child: rightContent ??
              Icon(
                Icons.check_circle_outline,
              ),
        ),
      );
}
