import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/core/extensions/size_extension.dart';

import 'package:multitool/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MultiTool')),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40.widthMultiplier, 
            vertical: 16.heightMultiplier,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/${Routes.pomodoro}'),
                child: const Text('Pomodoro Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
