import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/widgets/posts_widget.dart';
import 'package:flutter_music/widgets/stories_widget2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: const [
              StoryWidget(),
              SizedBox(height: 20),
              MyPost(index: 0),
              SizedBox(height: 10),
              MyPost(index: 1),
              SizedBox(height: 10),
              MyPost(index: 2),
            ],
          ),
        ),
      )),
    );
  }
}
