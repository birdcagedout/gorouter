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
            context.go('/');                    // 방법2
          },
          child: const Text('to Dashboard'),
        ),
      ),
    );
  }
}
