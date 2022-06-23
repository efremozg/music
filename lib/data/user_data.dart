class UserData {
  String userName, userAvatar;
  int? id;
  UserData(this.userName, this.userAvatar);
}

List<UserData> users = [
  UserData('PSEVDON1M', 'images/beatava1.jpeg'),
  UserData('Feel Sky', 'images/beatava2.jpeg'),
  UserData('Motis', 'images/beatava3.jpeg'),
  UserData('Квик', 'images/beatava4.jpeg'),
  UserData('Petuh', 'images/beatava5.jpeg'),
];

class PostMusicInfo {
  String beatName, typeBeat;

  PostMusicInfo(this.beatName, this.typeBeat);
}

List<PostMusicInfo> beatInfo = [
  PostMusicInfo('Солнце', 'Lil Krystall, Chimera'),
  PostMusicInfo('Circus', 'Pharaoh, SLAVA MARLOW'),
  PostMusicInfo('Rainbow of Love', 'Blago White, fem.Love'),
];
