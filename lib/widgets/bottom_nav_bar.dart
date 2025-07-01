import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/routes/routes.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          // case 0:
          //   context.go(Routes.home);
          //   break;
          case 0:
            context.go(Routes.pomodoro);
            break;
          case 1:
            context.go(Routes.compass);
            break;
        }
      },
      items: const [
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.home),
        //   label: 'Home',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: 'Pomodoro',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Compass',
        ),
      ],
    );
  }
}