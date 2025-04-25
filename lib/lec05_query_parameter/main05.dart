import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'dashboard.dart';

import 'route_names.dart';


void main() {
  runApp(MyApp());
}


// Query Parameter
//
// 1. queryParameter는 pathParameter와 다르게 반드시 GoRoute에서 정의할 필요는 없다.
//    즉, GoRoute에서 queryParameter를 정의하지 않아도 queryParameter는 사용 가능하다.
// 2. queryParameter도 pathParameter와 비슷하게 URL에 직접적으로 노출된다.
//    pathParameter는 URL에 path 부분으로 노출되지만,
//    queryParameter는 URL에 ?로 시작하는 query 부분으로 노출된다. ==> URI 참고자료 읽어볼 것!
//    즉, queryParameter는 URL에 ?로 시작하는 key=value 형태(ex. ?name=kim)로 노출된다.
// 3. queryParameter는 Map<String, String> 형태로 넘겨준다.


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
        // 3. path에 queryParameter를 위해 별도로 추가할 것은 없다.
        //    하지만, 생성자로 넘길 queryParameter값은 정해주어야 한다.
        //    이때 queryParameters의 key값(name)은 1번에서 넘겨준 key(name)와 일치해야 한다.
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
