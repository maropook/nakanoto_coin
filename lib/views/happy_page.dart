import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nakanoto_coin/views/enter_price.dart';
import 'package:nakanoto_coin/views/event_list.dart';
import 'package:nakanoto_coin/views/shop_list.dart';

class HappyPage extends StatefulWidget {
  const HappyPage({Key? key}) : super(key: key);

  @override
  _HappyPageState createState() => _HappyPageState();
}

class _HappyPageState extends State {
  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ハピー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', width: 150),
            const SizedBox(height: 20),
            Image.asset('images/sdgs.png'),
            const SizedBox(height: 20),
            const Text(
              '25 SDGs POINT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              '300 ハピー',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                'QRコードをスキャンする',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => scanQrCode(),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'SDGsイベント一覧',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showEvents(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text(
                'ハピー協賛店マップ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showMap(),
            ),
          ],
        ),
      ),
    );
  }

  Future scanQrCode() async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#EB394B',
      'キャンセル',
      true,
      ScanMode.QR,
    );
    if (!mounted) return;

    setState(() {
      enterPrice();
    });
  }

  Future enterPrice() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EnterPrice()));
  }

  Future showEvents() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EventList()));
  }

  Future showMap() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ShopList()));
  }
}
