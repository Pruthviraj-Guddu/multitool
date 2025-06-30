import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/core/extensions/size_extension.dart';
import 'package:multitool/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MultiTool')),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          _HomeContent(),
          Placeholder(), // Will be replaced with compass content
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          // Use pushReplacement instead of go for bottom nav
          if (index == 0) context.pushReplacement(Routes.pomodoro);
          if (index == 1) context.pushReplacement(Routes.pomodoro);
          if (index == 2) context.pushReplacement(Routes.compass);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: 'pomodoro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Compass',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.widthMultiplier,
          vertical: 16.heightMultiplier,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.push(Routes.pomodoro), //context.go(Routes.pomodoro),
              child: const Text('Pomodoro Timer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push(Routes.compass),
              child: const Text('Compass Tool'),
            ),
          ],
        ),
      ),
    );
  }
}
