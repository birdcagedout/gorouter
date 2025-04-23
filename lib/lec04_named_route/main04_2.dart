import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';

import 'route_names.dart';


void main() {
  runApp(MyApp());
}

// named route 2부.
// route 이름은 별도의 변수로 지정할 수도 있다. ==> RouteNames 클래스
// 또는 별도 파일로도 저장할 수 있다. ==> route_names.dart


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(

    routes: [
      GoRoute(
        // 1-1. named route 변수처리
        name: RouteNames.dashboard,
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),

      GoRoute(
        // 1-2. named route 변수 처리
        name: RouteNames.profile,
        path: '/profile/:name',
        builder: (context, state) => Profile(name: state.pathParameters['name']!),
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
