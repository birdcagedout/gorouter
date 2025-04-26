import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('PageB')),
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

            const SizedBox(height: 100),
            
            ElevatedButton(
              onPressed: () {
                context.push('/pageA');
              },
              child: const Text('PageA(/pageA)로 Push'),
            ),

            ElevatedButton(
              onPressed: () {
                context.push('/pageB');
              },
              child: const Text('PageB(/pageB)로 Push'),
            ),

            ElevatedButton(
              onPressed: () {
                context.push('/pageC');
              },
              child: const Text('PageC(/pageC)로 Push'),
            ),
          ],
        ),
      ),
    );
  }
}