class MetaDataModel {
  final String songId;

  final String songName;
  final String songUrl;
  MetaDataModel({this.songId = "", this.songName = "", this.songUrl = ""});

  factory MetaDataModel.fromJson(Map<String, dynamic> json) {
    return MetaDataModel(
      songUrl: json['response']['sections'][0]['hits'][0]['result']['path'],
      songId:
          json['response']['sections'][0]['hits'][0]['result']['id'].toString(),
      songName: json['response']['sections'][0]['hits'][0]['result']
          ['full_title'],
    );
  }
}
