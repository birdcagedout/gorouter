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

            // 3. child route 사용 시 주의사항
            // '/' 라우트에서 그 하위 라우트(subroute)로 go하는 경우 ==> 기존 라우트 위에 push 된다.
            context.go('/profile');
          },
          child: const Text('to Profile'),
        ),
      ),
    );
  }
}
