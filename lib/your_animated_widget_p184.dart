import 'package:flutter/material.dart';

class YourAnimatedWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const YourAnimatedWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  State<YourWidget> createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _resumeAnimation() {
    _animationController.forward();
  }

  void _pauseAnimation() {
    _animationController.stop();
  }

  void _repeatAnimation() {
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _startAnimation(),
      onDoubleTap: () => _pauseAnimation(),
      onLongPress: () => _resumeAnimation(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          print(_animationController.value);
          return const YourAnimatedWidget(
            width: 100,
            height: 100,
            // width: _animationController.value * 200,
            // height: _animationController.value * 200,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
