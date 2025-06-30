import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/features/pomodoro/pomodoro_page.dart';
import 'package:multitool/routes/routes.dart';
import 'package:multitool/home_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.pomodoro,
            name: Routes.pomodoro,
            builder: (BuildContext context, GoRouterState state) {
              return const PomodoroPage();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      return Scaffold(
        body: Center(
          child: Text('Route not found: ${state.uri.path}'),
        ),
      );
    },
    debugLogDiagnostics: true,
  );
}