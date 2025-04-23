import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/lec04_named_route/route_names.dart';


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
            Text('생성자로 넘어온 값: $name'),
            const SizedBox(height: 50,),

            ElevatedButton(
              onPressed: () {
            
                // 2-2. 이제 route에 이름을 붙여 navigation
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
