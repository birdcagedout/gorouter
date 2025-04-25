import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Center(
        child: Column(
          children: [

            // 3-1. pathParameter 넘기면서 라우팅
            //      라우팅마다 각각 name과 post를 넘겨줘야 한다.
            ElevatedButton(
              onPressed: () {
                context.go('/profile/kim/post/50');
              },
              child: const Text('to Profile(name:kim, post:50)'),
            ),
            SizedBox(height: 30,),

            // 3-2. pathParameter 넘기면서 라우팅
            //      라우팅마다 각각 name과 post를 넘겨줘야 한다.
            ElevatedButton(
              onPressed: () {
                context.go('/profile/park/post/100');
              },
              child: const Text('to Profile(name:park, post:100)'),
            ),
          ],
        ),
      ),
    );
  }
}
