import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Account',
      style: GoogleFonts.montserrat(textStyle: mainTextStyle),
    ));
  }
}
