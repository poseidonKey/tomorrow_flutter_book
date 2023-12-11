import 'package:flutter/material.dart';
import 'package:tommorow_flutter/disign_pattern_p207.dart';
import 'package:tommorow_flutter/staggerd_ani_p199.dart';
import 'package:tommorow_flutter/your_animated_widget_p184.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내일은 Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // customAnimationExample(),
            const SizedBox(
              height: 20,
            ),
            const YourWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaggeredAnimationExample(),
                  ),
                );
              },
              child: const Text('Staggerd Sample'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesignPatternP207(),
                  ),
                );
              },
              child: const Text('Design pattern'),
            ),
          ],
        ),
      ),
    );
  }
}
