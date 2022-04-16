import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakanoto_coin/service/styles.dart';
import 'package:nakanoto_coin/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      home: HomePage(),
    );
  }
}
