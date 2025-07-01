import 'package:flutter/material.dart';
import 'package:multitool/widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.go(Routes.pomodoro);
    return Scaffold(
      appBar: AppBar(title: const Text('MultiTool')),
      body: const Center(child: Text('Home Content')),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}