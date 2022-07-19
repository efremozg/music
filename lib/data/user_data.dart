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
  String beatName,
      typeBeat,
      trackName,
      tuneType,
      bpm,
      leasePrice,
      exclesivePrice;

  PostMusicInfo(this.beatName, this.typeBeat, this.trackName, this.bpm,
      this.exclesivePrice, this.leasePrice, this.tuneType);
}

List<PostMusicInfo> beatInfo = [
  PostMusicInfo('Солнце', 'Lil Krystall, Chimera', 'track2.mp3', '120 BPM',
      '5000', '700', 'B Major'),
  PostMusicInfo('Circus', 'Pharaoh, SLAVA MARLOW', 'track1.wav', '100 BPM',
      '4500', '500', 'A# Minor'),
  PostMusicInfo('Rainbow of Love', 'Blago White, fem.Love', 'track1.wav',
      '100 BPM', '4500', '500', 'A# Minor'),
];
