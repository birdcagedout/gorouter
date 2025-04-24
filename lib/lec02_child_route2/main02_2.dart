import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'a.dart';
import 'a1.dart';
import 'name.dart';
import 'b.dart';
import 'b1.dart';



void main() {
  runApp(MyApp());
}

// child route의 주요 특징 (https://chatgpt.com/share/6809c0d9-d3d4-800e-9ad2-275c3cdef471)
//
// 1. 자식 route를 정의할 때
//    - path가 '/'로 시작하면 안 된다. ==> '/'로 시작하면 최상위 route로 인식되므로, 해당 부모 route의 자식 route로 인식되지 않는다.
//      ex. '/a' 하위에 정의된 '/a1' ==> '/a'와 동등한 형제 route인 '/a1'로 인식된다. ('/a//a1'로 인식되지 않는다)
//    - 자식 route의 path가 '/'로 시작하지 않더라도 최종 경로는 '부모 route/자식 route' 형태가 된다. ex. '/a' 하위의 'a1' ==> '/a/a1'
//
// 2. 특정 자식 route로 go하는 경우
//    - 그 특정 route로 직접 바로 이동할 수 없고, 그 자식의 모든 부모 route가 자동으로 쌓이면서 이동된다.(자식 route만 push 되는 것이 아님)
//    - ex. '/a' 하위에 'a1'이 정의되고, 그 하위에 'name'이 정의된 경우에 'name'으로 go하려면 ==> 반드시 '/a/a1/name'으로 go해야 한다.
//
// 3. 부모 route에서 자식 route로 이동하는 경우 ==> go 하더라도 기존 라우트 위에 push 된다.(부모 route가 pop되지 않음)
//    - 직접 자식 route에만 적용되는 것이 아니며, 직계 후손으로 go하는 경우 중간 자식들도 모두 push 된다.
//      ex. '/a' 하위에 'a1'이 정의되고, 그 하위에 'name'이 정의된 경우에 '/a'에서 바로 'name'으로 go하더라도 ==> '/a/a1/name'로 이동하므로 a1이 자동 push 된다.
//
// 4. 자식 route에서 부모(또는 직계조상도 마찬가지) route로 이동하는 경우 ==> go 하더라도 중간 route들이 모두 pop된다.
//    - ex. '/a' 하위에 'a1'이 정의되고, 그 하위에 'name'이 정의된 경우에 '/a/a1/name'에서 '/a'로 go하면 ==> 'name'과 'a1'이 모두 pop되고 '/a'로 이동한다.
//
// 5. (2번 ~ 4번의 종합) 서로 직계관계가 아닌 경로들 간에 go하는 경우 ==> 공통조상까지 pop 되고, 대상 route까지는 push 된다.
//    - ex. '/a' 하위에 'a1'이 정의되고, 그 하위에 'name'이 정의된 route가 있고,
//          '/b' 하위에 'b1'이 정의된 경우, '/b/b1'에서 '/a/a1/name'으로 go하면
//           ==> 'b1'과 '/b'가 순차적으로 pop되고 '/a', 'a1', 'name'이 순차적으로 push 되어 최종 경로가 '/a/a1/name'이 된다.
//
// 그 외 자세한 사항은 위 링크를 참조할 것.


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/a', // 초기 경로

    routes: [
      // 1. '/a' - 'a1' - 'name'
      GoRoute(
        path: '/a',
        builder: (context, state) => const A(),
        routes: [
          GoRoute(
            path: 'a1',
            builder: (context, state) => const A1(),
            routes: [
              GoRoute(
                path: 'name', 
                builder: (context, state) => const Name(),
              ),
            ],
          ),
        ],
      ),

      // 2. '/b' - 'b1'
      GoRoute(
        path: '/b',
        builder: (context, state) => const B(),
        routes: [
          GoRoute(
            path: 'b1', 
            builder: (context, state) => const B1(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // 2. MaterialApp.router에서 routerConfig 등록
    return MaterialApp.router(title: 'Go Router Demo', routerConfig: _router);
  }
}
