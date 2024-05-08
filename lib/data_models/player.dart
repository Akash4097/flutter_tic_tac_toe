class Player {
  final String nickname;
  final String socketID;
  final String charType;
  final double points;

  Player({
    required this.nickname,
    required this.socketID,
    required this.charType,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'socketID': socketID,
      'charType': charType,
      'points': points,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickName'] as String,
      socketID: map['socketID'] as String,
      charType: map['charType'] as String,
      points: (map['points'] as int).toDouble(),
    );
  }
  Player copyWith({
    String? nickname,
    String? socketID,
    String? charType,
    double? points,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      charType: charType ?? this.charType,
      points: points ?? this.points,
    );
  }

  @override
  String toString() {
    return 'Player(nickname: $nickname, socketID: $socketID,'
        'charType: $charType, points: $points)';
  }
}
