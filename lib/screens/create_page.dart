import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({Key? key}) : super(key: key);

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'create posts & stories',
      style: GoogleFonts.montserrat(textStyle: mainTextStyle),
    ));
  }
}
