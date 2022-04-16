import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin/main.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';

class HomePage extends ConsumerWidget {
  String qrCode = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final PointViewModelProvider pointViewModel =
        ref.read(pointViewModelProvider.notifier);

    final pointState = ref.watch(pointViewModelProvider);
    bool getPoint = pointState.points.isNotEmpty;
    Point? point = getPoint ? pointState.points.first : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "なかのと",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/cherry_tree/full_bloom.png',
                width: shortestSide),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '  つぼみ',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  getPoint ? point!.point.toString() + ' 個  ' : '',
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '    開花',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  getPoint ? point!.usedPoint.toString() + ' 個  ' : '',
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset('assets/images/common/qrcode.png',
                      width: shortestSide / 2),
                  onTap: () => scanQrCode(ref),
                ),
                InkWell(
                  child: Image.asset('assets/images/common/use.png',
                      width: shortestSide / 2),
                  onTap: () => enterPrice(ref),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset('assets/images/common/sponsor_store.png',
                      width: shortestSide / 2),
                  onTap: () => showMap(ref),
                ),
                InkWell(
                  child: Image.asset('assets/images/common/event.png',
                      width: shortestSide / 2),
                  onTap: () => showEvents(ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future scanQrCode(WidgetRef ref) async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#EB394B',
      'キャンセル',
      true,
      ScanMode.QR,
    );

    enterPrice(ref);
  }

  Future enterPrice(WidgetRef ref) async {
    ref.read(buttonIdProvider.state).state = 1;
  }

  Future showEvents(WidgetRef ref) async {
    ref.read(buttonIdProvider.state).state = 2;
  }

  Future showMap(WidgetRef ref) async {
    ref.read(buttonIdProvider.state).state = 3;
  }
}
