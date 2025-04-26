import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main07.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          children: [
            Text('Login 상태: $isLoggedIn'),
            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoggedIn = !isLoggedIn; // 로그인 상태를 반전시킴
                });
              },
              child: isLoggedIn 
              ? const Text('Logout 하기') 
              : const Text('Login 하기'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                // 1. 로그인 상태를 변경한 후 홈 화면으로 이동
                context.go('/');
              },
              child: const Text('홈(/)으로 이동'),
            ),

            ElevatedButton(
              onPressed: () {
                // 1. 로그인 상태를 변경한 후 프로파일 화면으로 이동
                context.go('/profile');
              },
              child: const Text('프로파일(/profile)로 이동'),
            ),

            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // 1. 로그인 상태를 변경한 후 홈 화면으로 이동
                context.go('/mybox');
              },
              child: const Text('마이박스(/mybox)로 이동\n(정의되지 않은 route)'),
            ),
          ],
        ),
      ),
    );
  }
}
