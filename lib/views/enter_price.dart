import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nakanoto_coin/main.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/nakanoto_coin.dart';
import 'package:nakanoto_coin/service/styles.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:nakanoto_coin/components/my_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInputProvider = StateProvider<String>((ref) {
  return '';
});

final usePointProvider = StateProvider<int>((ref) {
  return 0;
});

class EnterPrice extends ConsumerWidget {
  EnterPrice({Key? key}) : super(key: key) {
    audioCache = AudioCache(fixedPlayer: AudioPlayer());
  }

  late AudioCache audioCache;

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
  Widget build(BuildContext context, WidgetRef ref) {
    String userInput = ref.watch(userInputProvider);
    final PointViewModelProvider pointViewModel =
        ref.read(pointViewModelProvider.notifier);

    final pointState = ref.watch(pointViewModelProvider);
    bool getPoint = pointState.points.isNotEmpty;
    Point? point = getPoint ? pointState.points.first : null;
    audioCache.loadAll(kSoundData);

    return Scaffold(
      appBar: AppBar(
        title: const Text("なかのとをつかう"),
      ), //AppBar
      backgroundColor: Styles.myButtonColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    getPoint
                        ? '現在のポイント ' + point!.point.toString() + ' pt  '
                        : '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput.isNotEmpty ? userInput : '0',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          child: const Text('つかう',
                              style: TextStyle(
                                  fontSize: 30, color: Styles.pageBackground)),
                          onPressed: () => pay(context, ref),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                            child: const Text('ためる',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Styles.pageBackground)),
                            onPressed: () => save(context, ref)),
                      ),
                    ],
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
                        ref.read(userInputProvider.state).state = '';
                      },
                      buttonText: buttons[index],
                      color: Colors.white,
                    );
                  }

                  // Delete Button
                  else if (index == 11) {
                    return MyButton(
                      onTap: () {
                        if (userInput.isEmpty) {
                          return;
                        }

                        ref.read(userInputProvider.state).state =
                            userInput.substring(0, userInput.length - 1);
                      },
                      buttonText: buttons[index],
                      color: Colors.white,
                    );
                  }

                  //  other buttons 0~9
                  else {
                    return MyButton(
                      onTap: () {
                        ref.read(userInputProvider.state).state +=
                            buttons[index];
                        debugPrint(userInput);
                      },
                      buttonText: buttons[index],
                      color: Styles.primaryColor700,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future pay(BuildContext context, WidgetRef ref) async {
    var rand = math.Random();
    var n = rand.nextInt(kSoundData.length);
    final pointViewModel = ref.watch(pointViewModelProvider);
    String userInput = ref.watch(userInputProvider);

    if (userInput.isEmpty ||
        pointViewModel.points[0].point < int.parse(userInput)) {
      return;
    }
    ref.read(usePointProvider.state).state = int.parse(userInput);
    await ref
        .read(pointViewModelProvider.notifier)
        .changeStatus(pointViewModel.points[0], int.parse(userInput), true);
    audioCache.play(kSoundData[n]);

    ref.read(buttonIdProvider.state).state = 4;
  }

  Future save(BuildContext context, WidgetRef ref) async {
    final pointState = ref.watch(pointViewModelProvider);
    String userInput = ref.watch(userInputProvider);
    if (userInput.isEmpty) {
      return;
    }
    ref.read(usePointProvider.state).state = int.parse(userInput);
    await ref
        .read(pointViewModelProvider.notifier)
        .changeStatus(pointState.points[0], int.parse(userInput), false);
    ref.read(buttonIdProvider.state).state = 5;
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
