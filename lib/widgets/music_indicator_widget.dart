import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';

class MusicIndicator extends StatefulWidget {
  const MusicIndicator({Key? key}) : super(key: key);

  @override
  State<MusicIndicator> createState() => _MusicIndicatorState();
}

class _MusicIndicatorState extends State<MusicIndicator> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  final timerFinishedAudio = "track1.wav";

  @override
  void initState() {
    super.initState();

    //audioPlayer.stop();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        audioPlayer.pause();
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    return [
      await audioPlayer.setSourceAsset('track1.wav'),
      await audioPlayer.pause(),
    ];
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              if (isPlaying) {
                await audioPlayer.pause();
              } else {
                await audioPlayer.resume();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  child: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                      color: foregroundColor)),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 102,
                  child: Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChangeEnd: (value) async {
                        await audioPlayer.resume();
                      },
                      onChanged: (value) async {
                        await audioPlayer.pause();
                        final position = Duration(seconds: value.toInt());
                        await audioPlayer.seek(position);
                      }),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 128,
                child: Padding(
                  padding: const EdgeInsets.only(top: 38, left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Text(formatTime(position),
                              style: secondTextStyle)),
                      SizedBox(
                        width: 40,
                        child: Text(formatTime(duration - position),
                            style: secondTextStyle),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
