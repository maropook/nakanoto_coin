import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakanoto_coin/service/styles.dart';
import 'package:nakanoto_coin/views/enter_price.dart';
import 'package:nakanoto_coin/views/event_list.dart';
import 'package:nakanoto_coin/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin/views/payed_page.dart';
import 'package:nakanoto_coin/views/shop_list.dart';

final buttonIdProvider = StateProvider((ref) => 0);

class NakanotoCoin extends ConsumerWidget {
  const NakanotoCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var buttonId = ref.watch(buttonIdProvider);
    return MaterialApp(
      title: 'なかのと',
      theme: ThemeData(
        primarySwatch: Styles.primarySwatch,
        primaryColor: Styles.primaryColor,
        brightness: Brightness.light,
        backgroundColor: Styles.pageBackground,
        appBarTheme: Styles.appBarTheme,
        scaffoldBackgroundColor: Styles.pageBackground,
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(
          Styles.textTheme,
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: HomePage(),
          ),
          if (buttonId == 1)
            MaterialPage(
              child: EnterPrice(),
            ),
          if (buttonId == 2)
            const MaterialPage(
              child: EventList(),
            ),
          if (buttonId == 3)
            const MaterialPage(
              child: ShopList(),
            ),
          if (buttonId == 4)
            const MaterialPage(
              child: PayedView(),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          ref.read(buttonIdProvider.state).state = 0;
          ref.read(userInputProvider.state).state = '';
          return true;
        },
      ),
    );
  }
}
