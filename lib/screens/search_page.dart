import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';

import '../widgets/posts_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchItemWidget(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              'Недавно искали:',
              style: mainTextStyle,
            ),
          ),
          const SizedBox(height: 20),
          searchRecently(context, 0)
        ],
      )),
    );
  }
}

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white38),
      decoration: InputDecoration(
          focusColor: Colors.white38,
          hoverColor: Colors.white38,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white38,
          ),
          suffixIconColor: Colors.grey[400],
          hintText: 'Поиск...',
          hintStyle: secondTextStyle,
          filled: true,
          fillColor: foregroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )),
    );
  }
}

Widget searchRecently(BuildContext context, int index) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    decoration: BoxDecoration(
        color: foregroundColor, borderRadius: BorderRadius.circular(10)),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: makerInfoButton(context, users[index]),
          ),
          const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: DotsMenu(),
              ))
        ]),
  );
}
