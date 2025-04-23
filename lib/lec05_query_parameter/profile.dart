import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/lec04_named_route/route_names.dart';


class Profile extends StatelessWidget {
  // 3. 생성자로 넘겨받을 변수를 정의한다.
  //    단, 이 이름은 다른 것과 일치할 필요가 없다. ==> pathParameter와는 다르다.
  final String userName;
  const Profile({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(
        child: Column(
          children: [
            Text('queryParameter로 넘어온 값: $userName'),  // 4. 넘어온 값을 확인한다
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
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
