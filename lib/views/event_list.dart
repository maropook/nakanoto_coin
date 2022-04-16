import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDGsイベント一覧'),
      ),
      body: ListView(children: [
        _menuItem("たのしいゴミ拾い", const Icon(Icons.settings)),
        _menuItem("プログラミングを学ぼう", const Icon(Icons.map)),
        _menuItem("実践、ジェンダー平等", const Icon(Icons.room)),
        _menuItem("ベトナム語はじめのいっぽ", const Icon(Icons.local_shipping)),
        _menuItem("完全食とは？", const Icon(Icons.airplanemode_active)),
      ]),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: icon,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        debugPrint("onTap called.");
      },
    );
  }
}
