import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';

class StoriesBarWidget extends StatefulWidget {
  const StoriesBarWidget({Key? key}) : super(key: key);

  @override
  State<StoriesBarWidget> createState() => _StoriesBarWidgetState();
}

class _StoriesBarWidgetState extends State<StoriesBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, int index) => StoryAnimation(index: index),
      ),
    );
  }
}

class StoryAnimation extends StatefulWidget {
  const StoryAnimation({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  State<StoryAnimation> createState() => _StoryAnimationState();
}

class _StoryAnimationState extends State<StoryAnimation>
    with TickerProviderStateMixin {
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

  Widget story(int index, UserData post) {
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
                    await controller.forward(from: 0);
                    isClicked = false;
                  }
                }),
                child: Transform.rotate(
                  angle: animation.value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: (isListen) ? bgColor : Colors.red, width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(post.userAvatar),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            post.userName,
            style: secondTextStyle,
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    int index = StoryAnimation(index: 3).index;
    UserData post = users[index];
    return story(index, post);
  }
}
