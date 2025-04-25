import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// 1. route가 정의되어 있지 않은 경우 이동할 페이지 정의
class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error 404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('페이지를 찾을 수 없습니다.(Error: 404)'),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('홈(/)으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}