import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // 2-2. state.name을 통해 현재 route의 이름을 확인할 수 있다.
    final String pathName = GoRouter.of(context).state.name!;   // 'dashboard'
    
    return Scaffold(
      appBar: AppBar(title: Text(pathName)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 2-1. 이제 route에 이름을 붙여 navigation
            // context.go('/profile');
            context.goNamed(
              RouteNames.profile,
              pathParameters: {'name': 'kim'},     // 3. goNamed를 사용할 때는 pathParameter는 Map형태로 넘겨준다.
            );
          },
          child: const Text('to Profile(kim)'),
        ),
      ),
    );
  }
}
