class MetaData {
  final String songId;

  final String songName;

  MetaData({
    this.songId,
    this.songName,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      songId: json['userId'],
      songName: json['id'],
    );
  }
}
