import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/lec04_named_route/route_names.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
        
            // 2-1. 이제 route에 이름을 붙여 navigation
            // context.go('/profile');
            context.goNamed(RouteNames.profile, pathParameters: {'name': 'kim'});   // 3. pathParameter는 Map형태로 넘겨준다.
          },
          child: const Text('to Profile(kim)'),
        ),
      ),
    );
  }
}
