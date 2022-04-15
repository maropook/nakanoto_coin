import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nakanoto_coin/views/my_button.dart';
import 'package:nakanoto_coin/views/payed_page.dart';

class EnterPrice extends StatefulWidget {
  const EnterPrice({Key? key}) : super(key: key);

  @override
  _EnterPriceState createState() => _EnterPriceState();
}

class _EnterPriceState extends State<EnterPrice> {
  AudioCache audioCache = AudioCache(fixedPlayer: AudioPlayer());

  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '<',
  ];

  @override
  Widget build(BuildContext context) {
    audioCache.loadAll(kSoundData);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ハピーをつかう"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    //alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: const Text('つかう',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      onPressed: () => pay(),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.5),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 9) {
                    return MyButton(
                      onTap: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.white,
                      textColor: Colors.black,
                    );
                  }

                  // Delete Button
                  else if (index == 11) {
                    return MyButton(
                      onTap: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.white,
                      textColor: Colors.black,
                    );
                  }

                  //  other buttons
                  else {
                    return MyButton(
                      onTap: () {
                        setState(() {
                          userInput += buttons[index];
                          debugPrint(userInput);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[50],
                      textColor: Colors.black,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future pay() async {
    var rand = math.Random();
    var n = rand.nextInt(kSoundData.length);
    audioCache.play(kSoundData[n]);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PayedView()));
  }
}

const kSoundData = [
  'sounds/happy1.m4a',
  'sounds/happy2.m4a',
  'sounds/happy3.m4a',
  'sounds/happy4.m4a',
  'sounds/happy5.m4a',
  'sounds/happy6.m4a',
  'sounds/happy7.m4a',
  'sounds/happy8.m4a',
  'sounds/happy9.m4a',
  'sounds/happya.m4a',
];
