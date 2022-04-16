import 'package:flutter/material.dart';

class PayedView extends StatelessWidget {
  const PayedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('なかのとをつかう'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'なかのとをつかいました',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'もどる',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        ),
      ),
    );
  }
}
