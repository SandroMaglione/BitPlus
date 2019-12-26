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
  /// Deafult time is [600] milliseconds
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
      milliseconds: 600,
    ),
  });

  @override
  _SlideActionTileState createState() => _SlideActionTileState();
}

class _SlideActionTileState extends State<SlideActionTile>
    with SingleTickerProviderStateMixin {
  double _startPress = 0;
  double _currentPress = 0;
  bool _isMoving = false;
  bool _isTriggeredOnLeft = false;
  bool _isTriggeredOnRight = false;

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
    final w = MediaQuery.of(context).size.width;
    _animController.duration = widget.animationDuration;
    _curvedAnimation.curve = widget.animationCurve;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _currentPress = details.localPosition.dx;
          _isTriggeredOnRight =
              _currentPress - _startPress > w * widget.triggerSlideAmount;
          _isTriggeredOnLeft =
              _startPress - _currentPress > w * widget.triggerSlideAmount;
        });
      },
      onHorizontalDragStart: (details) {
        setState(() {
          _startPress = details.localPosition.dx;
          _currentPress = details.localPosition.dx;
          _isMoving = true;
        });
      },
      onHorizontalDragEnd: (_) {
        _resetAnimation();
        _triggerSlideAction();

        setState(() {
          _isMoving = false;
          _isTriggeredOnLeft = false;
          _isTriggeredOnRight = false;
        });
      },
      child: AnimatedContent(
        isTriggeredOnLeft: _isTriggeredOnLeft,
        isTriggeredOnRight: _isTriggeredOnRight,
        translatePosition: _currentPress - _startPress,
        child: widget.child,
        isMoving: _isMoving,
        animation: _animation,
        leftContent: widget.leftContent,
        rightContent: widget.rightContent,
      ),
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
      begin: _currentPress - _startPress,
      end: 0,
    );

    _animation = _tween.animate(
      _curvedAnimation,
    );
  }

  /// Call [onSlideToLeft] or [onSlideToRight] based if enough slide amount
  void _triggerSlideAction() {
    if (_isTriggeredOnLeft && widget.onSlideToLeft != null) {
      widget.onSlideToLeft();
    } else if (_isTriggeredOnRight && widget.onSlideToRight != null) {
      widget.onSlideToRight();
    }
  }

  /// Reset and repeat the animation every slide
  void _resetAnimation() {
    _animController.reset();
    _tween.begin = _currentPress - _startPress;
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
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
