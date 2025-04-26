import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page_a.dart';
import 'page_b.dart';
import 'page_c.dart';


void main() {
  runApp(MyApp());
}

// Trainsiton Animation
// 1. route에서 다른 route로 이동할 때 애니메이션을 적용할 수 있다.
// 2. animation을 적용하기 위해서는 GoRoute의 pageBuilder를 사용해야 한다.


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/pageA',

    routes: [
      // 기본 route --> 그냥 builder 사용
      GoRoute(
        path: '/pageA', 
        builder: (context, state) => const PageA(),
      ),

      // 애니메이션을 적용 route --> pageBuilder 사용
      GoRoute(
        path: '/pageB', 
        // pageBuilder
        // - 필수: child와 transitionsBuilder,
        //    - transitionsBuilder: 애니메이션을 적용할 위젯(~~~Transition)을 리턴
        //      |- tween = begin + end + curve
        //      |- offsetAnimation = animation.drive(tween)
        // - 리턴: CustomTransitionPage
        //   transitionsBuilder
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PageB(),

            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);   // 아래에서 위로 올라오는 애니메이션 (화면 왼쪽 최상단 point의 상대위치 지정)
              const end = Offset.zero;          // 끝점 = (0,0) = 정상 화면 위치
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),

      // 애니메이션을 적용 route --> pageBuilder 사용
      GoRoute(
        path: '/pageC', 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PageC(),

            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (context, animation, secondaryAnimation, child,) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),    // opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Demo', 
      routerConfig: _router
    );
  }
}