import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 1. 생성자로 넘겨받을 변수를 정의한다.
//    변수 이름은 3군데에서 모두 일치해야 하므로 중요하다
class Profile extends StatelessWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(
        child: Column(
          children: [
            // 4. 넘어온 값을 확인한다 (kim or park)
            Text('pathParameter로 넘어온 값: $name'),
            SizedBox(height: 50,),
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
