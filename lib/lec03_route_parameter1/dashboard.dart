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

            // 3-1. name='kim'으로 pathParameter 넘기면서 라우팅
            ElevatedButton(
              onPressed: () {
                context.go('/profile/kim');
              },
              child: const Text('to Profile(kim)'),
            ),
            SizedBox(height: 30,),

            // 3-2. name='park'으로 pathParameter 넘기면서 라우팅
            ElevatedButton(
              onPressed: () {
                context.go('/profile/park');
              },
              child: const Text('to Profile(park)'),
            ),
          ],
        ),
      ),
    );
  }
}
