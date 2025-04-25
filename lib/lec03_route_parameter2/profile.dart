import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 1. 생성자로 넘겨받을 변수를 정의한다. ==> 2개를 모두 받아야 하므로 변수 2개 정의
class Profile extends StatelessWidget {
  final String name;
  final String post;
  const Profile({super.key, required this.name, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          children: [
            // 4. 넘어온 값을 확인한다.
            Text('pathParameter로 넘어온 값: $name'),
            Text('pathParameter로 넘어온 값: $post'),
            
            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
