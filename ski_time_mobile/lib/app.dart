import 'package:flutter/material.dart';
import 'package:ski_time_mobile/pages/my_hello_world_page.dart';
import 'package:go_router/go_router.dart';
import 'package:ski_time_mobile/pages/secondPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyHelloWorldPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return secondPage();
          },
        ),
      ],
    ),
  ],
);
