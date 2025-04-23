

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 4. GoRouter를 이용한 Route 이동
            // GoRouter.of(context).go('/');    // 방법1
            context.go('/');                    // 방법2
          },
          child: Text('to Dashboard'),
        ),
      ),
    );
  }
}
