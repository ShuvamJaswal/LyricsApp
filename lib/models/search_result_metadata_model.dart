// class SearchResultMetaDataModel {
//   final String songId;

//   final String songName;
//   final String songUrl;
//   SearchResultMetaDataModel(
//       {this.songId = "", this.songName = "", this.songUrl = ""});

//   factory SearchResultMetaDataModel.fromJson(Map<String, dynamic> json) {
//     return SearchResultMetaDataModel(
//       songUrl: json['response']['sections'][0]['hits'][0]['result']['path'],
//       songId:
//           json['response']['sections'][0]['hits'][0]['result']['id'].toString(),
//       songName: json['response']['sections'][0]['hits'][0]['result']
//           ['full_title'],
//     );
//   }
// }
class SearchResultMetaDataModel {
  final String songId;

  final String songName;
  final String songUrl;
  SearchResultMetaDataModel(
      {this.songId = "", this.songName = "", this.songUrl = ""});
}
