import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';


void main() {
  runApp(MyApp());
}


// pathParameters 2개 넘기기 (심화)

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),

      // 2. 2개 이상 넘길 때 주의할 점
      //    1) 라우트의 세그먼트를 분리하고
      //    2) 각각의 세그먼트에 pathParameter를 하나씩 붙여야 한다.
      //       ==> '/profile/:name:post' 이런 식으로 하면 안 된다.(name과 post를 구분할 수 없음)
      GoRoute(
        path: '/profile/:name/post/:post',
        builder: (context, state) => Profile(name: state.pathParameters['name']!, post: state.pathParameters['post']!),
      ),
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
