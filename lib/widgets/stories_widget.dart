import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';
import 'package:tween_image_widget/tween_image_widget.dart';

class StoriesBarWidget extends StatefulWidget {
  const StoriesBarWidget({Key? key}) : super(key: key);

  @override
  State<StoriesBarWidget> createState() => _StoriesBarWidgetState();
}

class _StoriesBarWidgetState extends State<StoriesBarWidget>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 15),
  )..stop();

  bool isClicked = false;

  Widget storyButton(BuildContext context, UserData post) {
    final animation = Tween(begin: 0.0, end: pi * 2).animate(controller);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: animation.value,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(post.userAvatar), fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(post.userName, style: secondTextStyle)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0.0, end: pi * 2).animate(controller);
    return Row(
      children: [
        SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width - 10,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                  onTap: (() {
                    controller.forward(from: 0);
                  }),
                  child: storyButton(context, users[0])),
              storyButton(context, users[1]),
              storyButton(context, users[2]),
              storyButton(context, users[3]),
              storyButton(context, users[4]),
              storyButton(context, users[4]),
              storyButton(context, users[4]),
            ],
          ),
        ),
      ],
    );
  }
}
