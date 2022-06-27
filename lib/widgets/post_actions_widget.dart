import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/models/favotite_page_models.dart';
import 'package:provider/provider.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:unicons/unicons.dart';

import '../models/favorite_list_models.dart';

class PostActionsWidget extends StatelessWidget {
  PostActionsWidget(this.index, {Key? key}) : super(key: key);
  final int index;

  final bool isLiked = false;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
      (favoritelist) => favoritelist.getByPosition(index),
    );
    {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AddButton(item: item),
        QudsPopupButton(
            backgroundColor: bgColor,
            tooltip: 'v',
            items: getMenuItems(),
            child:
                Icon(UniconsLine.info_circle, color: Colors.white, size: 28)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 1),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 34)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 73, 189, 102)),
            ),
            child: const Text('Купить'),
          ),
        ),
      ]);
    }
  }
}

class AddButton extends StatelessWidget {
  final Item item;

  const AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      splashRadius: 1,
      icon: isInFavoritePage
          ? Icon(UniconsLine.heart, color: Colors.red, size: 30)
          : Icon(UniconsLine.heart, color: Colors.white, size: 28),
      onPressed: isInFavoritePage
          ? () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.remove(item);
            }
          : () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.add(item);
            },
    );
  }
}

List<QudsPopupMenuBase> getMenuItems() {
  return [
    QudsPopupMenuItem(
        popOnTap: false,
        leading: Icon(Icons.abc, color: Colors.white),
        title: Text(
          'B Major',
          style: mainTextStyle,
        ),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        leading: Icon(Icons.music_note, color: Colors.white),
        title: Text(
          '140 BPM',
          style: mainTextStyle,
        ),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        leading: Icon(Icons.price_check, color: Colors.white),
        title: Text(
          'АРЕНДА: 500 РУБ.',
          style: mainTextStyle,
        ),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        leading: Icon(Icons.price_check, color: Colors.white),
        title: Text(
          'ЭКСКЛЮЗИВ: 5000 РУБ.',
          style: mainTextStyle,
        ),
        onPressed: () {}),
  ];
}
