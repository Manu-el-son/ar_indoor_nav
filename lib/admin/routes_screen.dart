import 'package:flutter/material.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes Screen'),
      ),
      body: const Center(
        child: Text('Manage Routes'),
      ),
    );
  }
}
