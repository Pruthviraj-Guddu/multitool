import 'package:flutter/material.dart';
import 'package:multitool/widgets/responsive_wrapper.dart';
// import 'package:go_router/go_router.dart';
// import 'features/pomodoro/pomodoro_page.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      child: MaterialApp.router(
        title: 'MultiTool',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
