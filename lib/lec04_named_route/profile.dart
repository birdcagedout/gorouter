import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';


class Profile extends StatelessWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // 2-2. state.name을 통해 현재 route의 이름을 확인할 수 있다.
    final String pathName = GoRouter.of(context).state.name!;   // 'profile'

    return Scaffold(
      appBar: AppBar(title: Text(pathName),),
      body: Center(
        child: Column(
          children: [
            Text('생성자로 넘어온 값: $name'),
            const SizedBox(height: 50,),

            ElevatedButton(
              onPressed: () {
            
                // 2-1. 이제 route에 이름을 붙여 navigation
                // context.go('/');
                context.goNamed(RouteNames.dashboard);
              },
              child: const Text('to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
