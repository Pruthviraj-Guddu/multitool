import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/routes/routes.dart';

class CompassPage extends StatelessWidget {
  const CompassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compass'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(Routes.home);
            }
          },
        ),
      ),
      body: const Center(
        child: Text('Compass Tool - Implementation coming soon'),
      ),
    );
  }
}
