import 'package:flutter/material.dart';

class CounterModel {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }
}

class CounterController {
  final CounterModel model;

  CounterController({required this.model});
  void increment() {
    model.increment();
  }

  void decrement() {
    model.decrement();
  }
}

class CounterView extends StatefulWidget {
  final CounterModel model;
  const CounterView({super.key, required this.model});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC design'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('count'),
            Text('count : $_cnt'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.model.increment();
                  _cnt = widget.model.count;
                });
              }),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.model.decrement();
                _cnt = widget.model.count;
              });
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
