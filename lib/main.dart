import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin/nakanoto_coin.dart';

void main() {
  runApp(
    const ProviderScope(
      child: NakanotoCoin(),
    ),
  );
}
