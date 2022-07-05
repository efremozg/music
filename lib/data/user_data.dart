class UserData {
  String userName, userAvatar;
  int? id;
  UserData(this.userName, this.userAvatar, this.id);
}

List<UserData> users = [
  UserData('PSEVDON1M', 'images/beatava1.jpeg', 0),
  UserData('Feel Sky', 'images/beatava2.jpeg', 1),
  UserData('Motis', 'images/beatava3.jpeg', 2),
  UserData('Квик', 'images/beatava4.jpeg', 3),
  UserData('Petuh', 'images/beatava5.jpeg', 4),
];

class PostMusicInfo {
  String beatName, typeBeat, trackName;

  PostMusicInfo(this.beatName, this.typeBeat, this.trackName);
}

List<PostMusicInfo> beatInfo = [
  PostMusicInfo('Солнце', 'Lil Krystall, Chimera', 'track2.mp3'),
  PostMusicInfo('Circus', 'Pharaoh, SLAVA MARLOW', 'track1.wav'),
  PostMusicInfo('Rainbow of Love', 'Blago White, fem.Love', 'track1.wav'),
];
