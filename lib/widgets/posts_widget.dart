import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/widgets/music_indicator_widget.dart';
import 'package:flutter_music/widgets/post_actions_widget.dart';
import 'package:marquee/marquee.dart';

import '../data/user_data.dart';

class MyPost extends StatelessWidget {
  final int index;
  const MyPost({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postPanel(context, index);
  }
}

Widget postPanel(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      decoration: BoxDecoration(
          color: foregroundColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                makerInfoButton(context, users[index]),
                const Align(alignment: Alignment.topRight, child: DotsMenu()),
              ],
            ),
            const SizedBox(height: 6),
            musicInfo(context, beatInfo[index]),
            const SizedBox(height: 8),
            MusicIndicator(),
            const SizedBox(height: 8),
            PostActionsWidget(index)
          ],
        ),
      ),
    ),
  );
}

Widget musicInfo(BuildContext context, PostMusicInfo information) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 130),
            child: Text(
              information.beatName,
              style: mainTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        const SizedBox(width: 10),
        Container(
          height: 22,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: Marquee(
                  text: information.typeBeat,
                  style: secondTextStyle,
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 10.0,
                  velocity: 50.0,
                  pauseAfterRound: Duration(seconds: 4),
                  startPadding: 2.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                )),
          ),
        ),
      ],
    ),
  );
}

Widget makerInfoButton(BuildContext context, UserData story) {
  return GestureDetector(
    onTap: () {
      print('click');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(story.userAvatar), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(story.userName, style: mainTextStyle)
        ],
      ),
    ),
  );
}

class DotsMenu extends StatelessWidget {
  const DotsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print('dots click');
        },
        child: Row(
          children: [
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            const SizedBox(width: 3),
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            const SizedBox(width: 3),
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
