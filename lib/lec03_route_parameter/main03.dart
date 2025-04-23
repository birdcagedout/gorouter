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
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),

      // 2. 파라미터 넘기기
      //    1) 라우트 뒤에 /:를 붙이고 아까 정의한 "변수이름"을 쓴다.
      //    2) 이 "변수이름"은 state.pathParameters맵의 key로 사용한다.
      //    ==> 만약 해당 맵의 match되는 value가 없으면 null값이 전달되므로 런타임 에러(Null check operator used on null value) 발생
      //    3) 결국 3가지가 모두 일치해야 됨(path/:변수이름 = 생성자로 넘길 parameter이름 = state.pathParameters의 key)
      GoRoute(
        path: '/profile/:name',
        builder: (context, state) => Profile(name: state.pathParameters['name']!),
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
