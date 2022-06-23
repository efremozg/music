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

  /// Get item by its position in the List.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the List
    // is also its id.
    return getById(position);
  }
}

class Item {
  final int id;
  final Widget item;

  const Item(this.id, this.item);

  // To make the sample app look nicer, each item is given id ,name and icon.

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
