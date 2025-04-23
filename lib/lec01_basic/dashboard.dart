import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 4. GoRouter를 이용한 Route 이동
            // GoRouter.of(context).go('/profile');   // 방법1
            context.go('/profile');                   // 방법2
          },
          child: const Text('to Profile'),
        ),
      ),
    );
  }
}
