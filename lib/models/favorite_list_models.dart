import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/posts_widget.dart';

class FavoriteListModel {
  static List<Widget> items = const [
    MyPost(index: 0),
    MyPost(index: 1),
    MyPost(index: 2)
  ];

  Item getById(int id) => Item(
        id,
        items[id % items.length],
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final Widget item;

  const Item(this.id, this.item);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
