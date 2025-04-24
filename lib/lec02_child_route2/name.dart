import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    final String path = GoRouter.of(context).state.uri.path;    // '/a/a1/name'
    
    return Scaffold(
      appBar: AppBar(title: Text(path)),
      body: Center(
        child: Column(
          children: [

            ElevatedButton(
              onPressed: () {
                context.go('/a/a1');
              },
              child: const Text('to a1'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/a');
              },
              child: const Text('to a'),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                context.go('/b');
              },
              child: const Text('to b'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/b/b1');
              },
              child: const Text('to b1'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
