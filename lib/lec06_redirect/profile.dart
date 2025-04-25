import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main06.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
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
              child:
                  isLoggedIn ? const Text('Logout 하기') : const Text('Login 하기'),
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
                // 1. 로그인 상태를 변경한 후 홈 화면으로 이동
                context.go('/profile');
              },
              child: const Text('프로파일(/profile)로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
