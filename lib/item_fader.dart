import 'package:flutter/material.dart';

class ItemFader extends StatefulWidget {
  final Widget child;
  final delay;
  final direction;

  ItemFader({this.child, this.delay, this.direction});

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(widget.delay, 1.0, curve: Curves.easeInOut),
        )
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context, child) {
        return Transform(
          transform: widget.direction == 'vertical' ? Matrix4.translationValues(0, _animation.value * height, 0)
                        : Matrix4.translationValues(_animation.value * width, 0, 0),
          child: child,
        );
      },
    );
  }
}
