import 'package:flutter/material.dart';
import 'package:nakanoto_coin/service/material_color_service.dart';
import 'package:nakanoto_coin/views/point_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColorService.primaryColor,
      ),
      home: PointListPage(),
    );
  }
}
