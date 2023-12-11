import 'package:flutter/material.dart';

class customAnimationExample extends StatefulWidget {
  const customAnimationExample({super.key});

  @override
  State<customAnimationExample> createState() => _customAnimationExampleState();
}

class _customAnimationExampleState extends State<customAnimationExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> _rotationAnimation;
  late AnimationController _animationController;
  double _containerWidth = 100;
  double _containerHeight = 100;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      _animationController,
    );
  }

  void _startAnimation() {
    setState(() {
      if (_containerWidth == 100) {
        _containerWidth = 200;
        _containerHeight = 200;
      } else {
        _containerWidth = 100;
        _containerHeight = 100;
      }
    });
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _startAnimation();
        },
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value,
                child: AnimatedContainer(
                  width: _containerWidth,
                  height: _containerHeight,
                  color: Colors.blue,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut,
                ),
              );
            }),
      ),
    );
  }
}
