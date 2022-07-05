import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, i) => StoryAnimation(value: i),
      ),
    );
  }
}

class StoryAnimation extends StatefulWidget {
  final int value;
  const StoryAnimation({
    required this.value,
    Key? key,
  }) : super(key: key);

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
                            image: AssetImage(users[index].userAvatar),
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
            users[index].userName,
            style: secondTextStyle,
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return story(widget.value);
  }
}
