import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/viewModels/point_view_model.dart';
import 'package:nakanoto_coin/views/happy_page.dart';
import 'package:nakanoto_coin/views/point_add_page.dart';

class PointListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: _pointList(ref),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭が下に配置されます。
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 1つ目のFAB
          FloatingActionButton(
            heroTag: "happy",
            child: Icon(Icons.face),
            backgroundColor: Colors.blue[200],
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HappyPage();
                  },
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          // 2つ目のFAB
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              heroTag: "scan",
              child: const Icon(Icons.edit),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PointAddPage();
                    },
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _pointList(WidgetRef ref) {
    final PointViewModelProvider pointViewModel =
        ref.read(pointViewModelProvider.notifier);
    final pointState = ref.watch(pointViewModelProvider);

    return ListView.builder(
      itemCount: pointState.points.length,
      itemBuilder: (BuildContext context, int index) {
        final point = pointState.points[index];

        return _pointItem(point, index, pointViewModel);
      },
    );
  }

  Widget _pointItem(
      Point point, int index, PointViewModelProvider pointViewModel) {
    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: '削除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            await pointViewModel.deletePoint(point.id!);
          },
        ),
      ],
      child: CheckboxListTile(
        title: Text(
          point.point.toString(),
          style: TextStyle(
              decoration: point.point == 0
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        value: point.point == 0 ? true : false,
        onChanged: (value) {
          pointViewModel.changeStatus(point);
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
