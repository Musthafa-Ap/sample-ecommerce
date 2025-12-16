import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Counter Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}