import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:nakanoto_coin/views/enter_price.dart';
import 'package:nakanoto_coin/views/event_list.dart';
import 'package:nakanoto_coin/views/shop_list.dart';

class HappyPage extends ConsumerWidget {
  String qrCode = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PointViewModelProvider pointViewModel =
        ref.read(pointViewModelProvider.notifier);

    final pointState = ref.watch(pointViewModelProvider);
    bool getPoint = pointState.points.isNotEmpty;
    Point? point = getPoint ? pointState.points.first : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('なかのと'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 150),
            const SizedBox(height: 20),
            Image.asset('assets/images/sdgs.png'),
            const SizedBox(height: 20),
            Text(
              getPoint ? point!.point.toString() + 'ポイント' : '',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              getPoint ? point!.usedPoint.toString() + '使ったポイント' : '',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                'QRコードをスキャンする',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => scanQrCode(context),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'SDGsイベント一覧',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showEvents(context),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text(
                'なかのと協賛店マップ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showMap(context),
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
