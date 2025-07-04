import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitool/features/compass/compass_page.dart';
import 'package:multitool/features/pomodoro/pomodoro_page.dart';
import 'package:multitool/features/profile/profile_page.dart';
import 'package:multitool/routes/routes.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation:Routes.pomodoro ,
    routes: <RouteBase>[
      // GoRoute(
      //   path: Routes.home,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomePage();
      //   },
      // ),
      GoRoute(
        path: Routes.pomodoro,
        name: 'pomodoro',
        builder: (BuildContext context, GoRouterState state) {
          return const PomodoroPage();
        },
      ),
      GoRoute(
        path: Routes.compass,
        name: 'compass',
        builder: (BuildContext context, GoRouterState state) {
          return const CompassPage();
        },
      ),
      GoRoute(
        path: Routes.profile,
        name: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
        },
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      return Scaffold(
        body: Center(
          child: Text('Route not found: ${state.uri.path}'),
        ),
      );
    },
  );
}