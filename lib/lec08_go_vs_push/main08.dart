import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page_a.dart';
import 'page_b.dart';
import 'page_c.dart';


void main() {
  runApp(MyApp());
}

// Go vs. Push
// 1. Go: 새로운 page를 push하고 현재 page를 pop한다.(psuh 먼저 pop 나중)
//    - 현재 route(/pageA)에서 현재 route(/pageA)로 go하면, 아무런 push, pop이 일어나지 않는다.
//    - 단, 현재 route가 여러단계의 push를 거듭한 상태에서, 동등한 새로운 route로 go하면 새로운 route를 push한 후에 모든 stack을 pop한다.
//       ex. 현재 (/pageA, /pageB, /pageC) 상태에서 /pageB로 go하면, /pageB는 push되고, /pageC, /pageB, /pageA는 순서대로 pop된다.
// 
// 2. Push: (현재 page를 stack에 남겨두고) 새로운 page를 push한다.
//    - 이전 routeStack에 새로운 page가 있더라도 push된다.
//       ex. 현재 (/pageB) 상태에서 /pageB로 push하더라도 (/pageB, /pageB) 상태가 된다.
//
// (주의) 
// 1. 부모 route에서 자식 route로 이동할 때는 'Go'를 사용해야 한다.
// 2. 자식 route에서 부모 route로 이동할 때는 'Go'를 사용해야 한다.


// 그 외 기타 이동 함수
// 1. replace: 현재 route를 새로운 route로 교체한다. 이전 page와 똑같은 key값을 재사용하며, animation이 없다.
// 2. pushReplacement: 현재 route를 새로운 route로 교체한다. 새로운 key값을 사용하며, animation이 있다.
 


// 라우트 스택 상태를 관찰하기 위한 observer
MyNavObserver myNavObserver = MyNavObserver();


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/pageA',

    routes: [
      GoRoute(path: '/pageA', builder: (context, state) => const PageA()),

      GoRoute(path: '/pageB', builder: (context, state) => const PageB()),

      GoRoute(path: '/pageC', builder: (context, state) => const PageC()),
    ],

    observers: [myNavObserver],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Demo', 
      routerConfig: _router
    );
  }
}


// 라우트 스택 상태를 관찰하기 위한 observer
// push, pop, remove, replace 시에 routeStack을 업데이트한다.
class MyNavObserver extends NavigatorObserver {
  final List<Route<dynamic>> routeStack = [];  // 라우트 스택 상태를 저장하는 리스트(앞쪽: 먼저, 뒤쪽: 나중)

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route);

    debugPrint('didPush: ${route.settings.name}');
    debugPrint('backStack: ${routeStack.map((e) => e.settings.name)}\n');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.remove(route);

    debugPrint('didPop: ${route.settings.name}');
    debugPrint('backStack: ${routeStack.map((e) => e.settings.name)}\n');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    routeStack.remove(route);

    debugPrint('didRemove: ${route.settings.name}');
    debugPrint('backStack: ${routeStack.map((e) => e.settings.name)}\n');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) routeStack.remove(oldRoute);
    if (newRoute != null) routeStack.add(newRoute);

    debugPrint('didReplace: old=${oldRoute?.settings.name}, new=${newRoute?.settings.name}',);
    debugPrint('backStack: ${routeStack.map((e) => e.settings.name)}\n');
  }
}
