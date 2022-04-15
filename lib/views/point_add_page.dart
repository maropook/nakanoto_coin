import 'package:flutter/material.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PointAddPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PointViewModelProvider pointViewModel =
        ref.read(pointViewModelProvider.notifier);

    final _titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
          ),
          ElevatedButton(
            onPressed: () async {
              await pointViewModel.addPoint(_titleController.text);

              Navigator.pop(context);
            },
            child: const Text('追加'),
          ),
        ],
      ),
    );
  }
}
