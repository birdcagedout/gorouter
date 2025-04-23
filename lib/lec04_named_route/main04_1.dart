import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

// named route 1부
// route에 이름을 붙일 수 있다.

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        // 1-1. named route
        //      route에 이름을 붙일 수 있다.
        //      name: 'dashboard'로 지정하면, context.goNamed('dashboard')로 라우팅 가능
        name: 'dashboard',
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),

      GoRoute(
        // 1-2. named route
        //      name: 'profile'로 지정하면, context.goNamed('profile')로 라우팅 가능
        name: 'profile',
        path: '/profile/:name',
        builder:
            (context, state) => Profile(name: state.pathParameters['name']!),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Go Router Demo', routerConfig: _router);
  }
}
