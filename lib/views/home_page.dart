import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:nakanoto_coin/views/enter_price.dart';
import 'package:nakanoto_coin/views/event_list.dart';
import 'package:nakanoto_coin/views/shop_list.dart';

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
                  getPoint ? point!.usedPoint.toString() + '個  ' : '',
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
                  getPoint ? point!.usedPoint.toString() + '個  ' : '',
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset('assets/images/common/qrcode.png',
                      width: shortestSide / 2),
                  onTap: () => scanQrCode(context),
                ),
                InkWell(
                  child: Image.asset('assets/images/common/use.png',
                      width: shortestSide / 2),
                  onTap: () => enterPrice(context),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset('assets/images/common/sponsor_store.png',
                      width: shortestSide / 2),
                  onTap: () => showMap(context),
                ),
                InkWell(
                  child: Image.asset('assets/images/common/event.png',
                      width: shortestSide / 2),
                  onTap: () => showEvents(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future scanQrCode(BuildContext context) async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#EB394B',
      'キャンセル',
      true,
      ScanMode.QR,
    );

    enterPrice(context);
  }

  Future enterPrice(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterPrice()));
  }

  Future showEvents(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EventList()));
  }

  Future showMap(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ShopList()));
  }
}
