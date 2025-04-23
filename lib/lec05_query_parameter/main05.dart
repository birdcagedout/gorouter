import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';

import 'route_names.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(

    routes: [
      GoRoute(
        name: RouteNames.dashboard,
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),

      GoRoute(
        name: RouteNames.profile,
        // 2. path에 queryParameter를 위해 별도로 추가할 것은 없다.
        //    다만, queryParameter가 넘어갈 때 URL은 /profile?name=kim 형태가 된다.
        path: '/profile',
        builder: (context, state) => Profile(userName: state.uri.queryParameters['name']!),   // state.uri 밑에 queryParameters가 있음에 주의!!
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Demo',
      routerConfig: _router,
    );
  }
}
