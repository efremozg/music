import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/models/favotite_page_models.dart';
import 'package:provider/provider.dart';
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
        IconButton(
            splashRadius: 1,
            onPressed: () {
              isClicked = !isClicked;
            },
            icon: isClicked
                ? const Icon(UniconsLine.info_circle,
                    color: Colors.white, size: 30)
                : const Icon(
                    UniconsLine.info_circle,
                    color: Colors.white,
                    size: 28,
                  )),
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
