import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'error404.dart';
import 'home.dart';
import 'login.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

// Error Handling
// 1. 만약 이동하려는 route가 정의되어 있지 않은 경우 ==> 특정 에러 페이지(ex. 404 페이지)로 이동
// 2. GoRouter의 errorBuilder 속성을 사용한다.
//
// (주의) 로그인 안 한 상태에서 "정의되지 않은 route"로 이동하려고 할 때
//    시나리오1: 무조건 우선적으로 로그인 페이지로 이동한다.            --> 이미 현재 구현상태로 이렇게 동작함
//    시나리오2: 로그인 페이지로 이동하지 않고 에러 페이지로 이동한다.
//    ==> 시나리오 2을 구현하기 위해서는 redirect에 특별한 조건을 추가해야 한다.

bool isLoggedIn = false; // 로그인 상태를 나타내는 변수

int count = 0;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const Error404(),

    redirect: (context, state) {
      // <시나리오1>
      // 로그인하지 않은 상태라면 어떤 페이지를 이동하려 하든지 ==> 무조건 우선적으로 "로그인" 페이지로 이동
      // if (!isLoggedIn) {
      //   return '/login';
      // } else {
      //   return null;
      // }


      // 디버그용 값 찍어봄
      print('현재 ${count++}번째 테스트 중...');
      print('state.matchedLocation: ${state.matchedLocation}');     // 경로 템플릿에 매칭된 '실제 경로 문자열'
      print('state.fullPath: ${state.fullPath}');                   // '전체 경로의 템플릿문자열'
      print('state.path: ${state.path}');                           // 각각의 route 진입 후에서만 '특정 템플릿문자열' 가짐 (전역에서는 null)
      print('\n');
      

      // <시나리오2>
      // (로그인 했든 안했든) '정의되지 않은 route'로 이동하려고 하면 ==> Error 페이지로 이동
      // state.fullPath가 빈 문자열 '' 이면 '정의되지 않은 route'
      if ( (state.fullPath ?? '').isEmpty) {
        return null;
      }

      // 로그인 안한 경우
      if (!isLoggedIn) {       
        // 로그인 페이지로 이동
        return '/login';
      } else {
        // 로그인한 경우 => 아무 리다이렉트 없이 원래 요청대로
        return null;
      }
    },

    // 원래 routes 정의
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Home()),

      GoRoute(path: '/login', builder: (context, state) => const Login()),

      GoRoute(path: '/profile', builder: (context, state) => const Profile()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Go Router Demo', routerConfig: _router);
  }
}
