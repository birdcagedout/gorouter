import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

class Profile extends StatelessWidget {
  // 2. 생성자로 넘겨받을 변수를 정의한다.
  //    단, 이 이름은 queryParameters의 key와 반드시 일치할 필요는 없다. ==> pathParameter와는 다르다.
  final String userName;
  const Profile({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // 4. state.uri을 통해 현재 uri를 확인할 수 있다.
    final String uri = GoRouter.of(context).state.uri.toString();

    return Scaffold(
      appBar: AppBar(title: Text('uri: $uri')), // uri: /profile?name=kim
      body: Center(
        child: Column(
          children: [
            Text('queryParameter["name"]으로 넘어온 값: $userName'), // 5. 넘어온 값을 확인한다
            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
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
