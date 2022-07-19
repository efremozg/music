import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/widgets/music_indicator_widget.dart';
import 'package:flutter_music/widgets/post_actions_widget.dart';
import 'package:marquee/marquee.dart';
import 'package:unicons/unicons.dart';

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
  bool isClicked = true;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ExpansionWidget(
      duration: Duration(milliseconds: 100),
      titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          decoration: BoxDecoration(
              color: foregroundColor,
              borderRadius: isClicked
                  ? BorderRadius.circular(16)
                  : const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    )),
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
                    const Align(
                        alignment: Alignment.topRight, child: DotsMenu()),
                  ],
                ),
                const SizedBox(height: 6),
                musicInfo(context, beatInfo[index]),
                const SizedBox(height: 8),
                MusicIndicator(index),
                const SizedBox(height: 8),
                Stack(children: [
                  PostActionsWidget(index),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: IconButton(
                        onPressed: () {
                          isClicked = !isClicked;
                          toogleFunction(animated: true);
                        },
                        icon: isClicked
                            ? const Icon(UniconsLine.info_circle,
                                color: Colors.white, size: 28)
                            : Icon(UniconsLine.info_circle,
                                color: Colors.white.withOpacity(0.6),
                                size: 30)),
                  ),
                ]),
              ],
            ),
          ),
        );
      },
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: isClicked ? foregroundColor : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(UniconsLine.music, color: Colors.white, size: 14),
                SizedBox(width: 8),
                Text(
                  beatInfo[index].bpm,
                  style: secondTextStyle,
                )
              ],
            ),
            Row(
              children: [
                Icon(UniconsLine.music, color: Colors.white, size: 14),
                SizedBox(width: 8),
                Text(
                  beatInfo[index].tuneType,
                  style: secondTextStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.currency_ruble, color: Colors.white, size: 14),
                SizedBox(width: 4),
                Text(
                  beatInfo[index].leasePrice,
                  style: secondTextStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.currency_ruble, color: Colors.white, size: 14),
                SizedBox(width: 4),
                Text(
                  beatInfo[index].exclesivePrice,
                  style: secondTextStyle,
                )
              ],
            )
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
            constraints: const BoxConstraints(maxWidth: 130),
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
    onTap: () {},
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
        onTap: () {},
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
