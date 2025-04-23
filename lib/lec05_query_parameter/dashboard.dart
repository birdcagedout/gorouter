import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/lec04_named_route/route_names.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            // 1. 만약 다른 route로 이동할 때 parameter를 넘기고 싶다면 ==> queryParameter 사용
            //    이때 Map의 key는 GoRoute에서 정의한 queryParameters의 key와 일치해야 한다.
            context.goNamed(RouteNames.profile, queryParameters: {'name': 'suhanmu'});  // Map<String, String> 형태로 넘긴다.
          },
          child: const Text('to Profile(suhanmu)'),
        ),
      ),
    );
  }
}
