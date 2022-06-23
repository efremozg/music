import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';

class StoriesBarWidget extends StatefulWidget {
  const StoriesBarWidget({Key? key}) : super(key: key);

  @override
  State<StoriesBarWidget> createState() => _StoriesBarWidgetState();
}

class _StoriesBarWidgetState extends State<StoriesBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..stop();
  }

  bool isClicked = false;
  bool isListen = false;

  Widget storyImage(BuildContext context, UserData post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          border:
              Border.all(color: (isListen) ? bgColor : Colors.red, width: 2),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(post.userAvatar), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget storyUserName(BuildContext context, UserData post) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          post.userName,
          style: secondTextStyle,
        ));
  }

  Widget story(int index) {
    final animation = Tween(begin: 0.0, end: 6 * pi * 2).animate(controller);
    return Stack(alignment: Alignment.bottomCenter, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, child) {
              return GestureDetector(
                onTap: (() async {
                  if (isClicked == false) {
                    isClicked = true;
                    isListen = true;
                    print(users);
                    await controller.forward(from: 0);
                    isClicked = false;
                  }
                }),
                child: Transform.rotate(
                  angle: animation.value,
                  child: storyImage(context, users[index]),
                ),
              );
            },
          )),
      storyUserName(context, users[index])
    ]);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width - 10,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              story(0),
              story(1),
              story(2),
              story(3),
              story(4),
            ],
          ),
        ),
      ],
    );
  }
}
