import 'package:flutter/material.dart';

class StaggeredAnimationExample extends StatefulWidget {
  const StaggeredAnimationExample({super.key});

  @override
  State<StaggeredAnimationExample> createState() =>
      _StaggeredAnimationExampleState();
}

class _StaggeredAnimationExampleState extends State<StaggeredAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );
    _animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내일은 Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation1,
              builder: (_, __) {
                return Opacity(
                  opacity: _animation1.value,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      100 * (1 - _animation1.value),
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: _animation2,
              builder: (_, __) {
                return Opacity(
                  opacity: _animation2.value,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      100 * (1 - _animation2.value),
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.deepPurple,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
