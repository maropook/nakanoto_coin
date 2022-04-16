import 'package:flutter/material.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('なかのと協賛店マップ'),
      ),
      body: ListView(children: [
        _menuItem("おみせA", const Icon(Icons.store)),
        _menuItem("おみせB", const Icon(Icons.store)),
        _menuItem("おみせC", const Icon(Icons.store)),
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
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        // ignore: avoid_print
        print("onTap called.");
      },
    );
  }
}
