import 'package:flutter/material.dart';
import 'package:flutter_music/screens/account_page.dart';
import 'package:flutter_music/screens/create_page.dart';
import 'package:flutter_music/screens/home_page.dart';
import 'package:flutter_music/screens/liked_page.dart';
import 'package:flutter_music/screens/search_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_music/constants.dart';

import 'models/favorite_list_models.dart';
import 'models/favotite_page_models.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null)
              throw ArgumentError.notNull('favoritepage');
            favoritepage.favoritelist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final myscreens = <Widget>[
    const HomePage(),
    const SearchPage(),
    const CreationPage(),
    const LikedPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: IndexedStack(index: currentIndex, children: myscreens),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: foregroundColor,
                icon: Icon(Icons.whatshot),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: foregroundColor,
                icon: Icon(UniconsLine.search),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: foregroundColor,
                icon: Icon(UniconsLine.music_note),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: foregroundColor,
                icon: Icon(Ionicons.heart),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: foregroundColor,
                icon: Icon(Ionicons.person_circle),
                label: ''),
          ]),
    );
  }
}
