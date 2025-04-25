import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. state.uri을 통해 현재 uri를 확인할 수 있다.
    final String uri = GoRouter.of(context).state.uri.toString();
    
    return Scaffold(
      appBar: AppBar(title: Text('uri: $uri'),),  // uri: /
      body: Center(
        child: Column(
          children: [
            
            ElevatedButton(
              onPressed: () {
                // 1. queryParameter 사용
            
                // 1-1. go를 사용하는 경우: path 뒤에 query 형태로 넘긴다
                context.go('/profile?name=kim');  // queryParameter는 path에 ?로 시작하는 형태로 넘긴다.
              },
              child: const Text('go로 profile 이동\n(/profile?name=kim)'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                // 1-2. goNamed를 사용하는 경우: path 뒤에 query 형태로 넘긴다
                context.goNamed(RouteNames.profile, queryParameters: {'name': 'park'});
              },
              child: const Text('goNamed로 Profile 이동\n(queryParameters: {"name: "park"})'),
            ),
          ],
        ),
      ),
    );
  }
}
