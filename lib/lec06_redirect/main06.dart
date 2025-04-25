import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'login.dart';
import 'profile.dart';


void main() {
  runApp(MyApp());
}


// Redirect
// 1. state값에 따라 route가 새로운 페이지로 변경되도록 설정하려는 경우에 사용한다.
//    ex. 사용자가 로그인하지 않은 상태라면 홈화면 대신 로그인 페이지로 redirect할 수 있다.
// 2. GoRouter의 redirect 속성을 사용한다.
// 3. redirect 속성은 GoRouter에 정의된 기존 routes 속성들과 함께 사용한다.
// 4. redirect 속성은 GoRouter의 routes 속성에 정의된 route를 변경하는 것이 아니라, 새로운 route를 추가하는 것이다.


bool isLoggedIn = false; // 로그인 상태를 나타내는 변수


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(

    // 1. redirect 속성 추가
    redirect: (context, state) {
      // 2. 사용자가 로그인하지 않은 상태라면 ==> 어떤 페이지로 이동을 원하더라도 Login 페이지로 redirect
      if (!isLoggedIn) {
        return '/login'; // 로그인 페이지로 redirect
      } else {
        // 3. 사용자가 로그인한 상태라면 ==> 원하는 페이지로 이동
        return null;
      }
    },
    
    // 원래 routes 정의
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Home(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),

      GoRoute(
        path: '/profile',
        builder:
            (context, state) => const Profile(),
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
