import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(

    routes: [
      // 1. '/' 라우트 내에 child route를 등록할 수 있다
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
        routes: [
          // 2. 슬래시('/')가 없음에 주의!! ==> '/profile' 라우트와 동일함
          GoRoute(path: 'profile', builder: (context, state) => const Profile(),),
        ],
      ),
      // 3. 아래 라우트가 없어도 실행된다
      // GoRoute(path: '/profile', builder: (context, state) => const Profile(),),
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
