import 'package:flutter/material.dart';

class SplashOldPage extends StatelessWidget {
  const SplashOldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Splash Page'),
            const Text('This is a subtitle'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('This is a subtitle'),
                Text('This is a subtitle'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                'assets/images/domestika-logo.png',
                width: 100,
                height: 100,
              ),
            ),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}
