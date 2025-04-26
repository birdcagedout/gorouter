import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';




class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('PageA')),
      body: Center(
        child: Column(
          children: [

            ElevatedButton(
              onPressed: () {
                context.go('/pageA');
              },
              child: const Text('PageA(/pageA)로 Go'),
            ),

            ElevatedButton(
              onPressed: () {
                context.go('/pageB');
              },
              child: const Text('PageB(/pageA)로 Go'),
            ),

            ElevatedButton(
              onPressed: () {
                context.go('/pageC');
              },
              child: const Text('PageC(/pageC)로 Go'),
            ),
            
          ],
        ),
      ),
    );
  }
}