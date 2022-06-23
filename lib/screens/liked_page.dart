import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_music/constants.dart';
import 'package:provider/provider.dart';

import '../models/favotite_page_models.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: foregroundColor,
        title: const Text('Избранное', style: mainTextStyle),
        centerTitle: true,
      ),
      body: _FavoritePageList(),
    );
  }
}

class _FavoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritepage = context.watch<FavoritePageModel>();

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: favoritepage.items.length,
        itemBuilder: (context, index) => favoritepage.items[index].item,
      ),
    );
  }
}
