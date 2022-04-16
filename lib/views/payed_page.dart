import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:nakanoto_coin/views/enter_price.dart';

class PayedView extends ConsumerWidget {
  PayedView(this.isPay, {Key? key}) : super(key: key);
  bool isPay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final point = ref.watch(usePointProvider);
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      appBar: AppBar(
        title: const Text('なかのと'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isPay
                  ? 'つぼみが\n' + point.toString() + '個\n開花しました'
                  : 'つぼみが\n' + point.toString() + '個\n増えました',
              style: const TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            InkWell(
              child: Image.asset(
                'assets/images/common/return.png',
                width: shortestSide / 2.3,
              ),
              onTap: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/common/cherry_blossoms.png',
                  width: shortestSide / 2,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
