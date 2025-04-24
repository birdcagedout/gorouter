import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';

// YouTube GoRouter 강의
// https://youtube.com/playlist?list=PLCaS22Sjc8YTQCxP0of90oatXiAei6vTT&si=C1DFU3tlYQK0kswL

void main() {
  runApp(MyApp());
}

// 0. 루트 앱에
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // 1. GoRouter configuration 정의
  final GoRouter _router = GoRouter(
    // 3. initial route를 별도로 등록할 수도 있다.
    initialLocation: '/profile',

    routes: [
      GoRoute(path: '/', builder: (context, state) => const Dashboard(),),          // initial route(필수) -> 없으면 Page Not Found
      GoRoute(path: '/profile', builder: (context, state) => const Profile(),),
    ],
  );


  @override
  Widget build(BuildContext context) {

    // 2. MaterialApp.router에서 routerConfig 등록
    return MaterialApp.router(
      title: 'Go Router Demo',
      routerConfig: _router,
    );
  }
}
