import 'dart:convert';
import 'dart:io';
import 'api_key.dart';
import 'package:http/http.dart' as http;

Future<String> searchSongMetaData(String songData, String searchTerm) async {
  print(searchTerm);
  var retreivedData = await http.get(
    Uri.parse('https://genius.com/api/songs/$songData'),
  );
  // var retreivedData = await http
  //     .get(Uri.parse('https://api.genius.com/songs/2458848'), headers: {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': 'Bearer ' +
  //       'x4KmXM_uZWffDM2dLXbubQ8QFRYrzXnsM58V8oKYSxHSCT2sykPkao7xUEsbixOU'
  // });
  lyricsUrl = "https://genius.com" +
      jsonDecode(retreivedData.body)['response']['song']['path'].toString();
  //print(lyricsUrl);
  return lyricsUrl;
}

Future<String> fetchLyrics(String lyricsUrl) async {
  var retreivedLyricsData = await http.get(
    Uri.parse(lyricsUrl),
  );
  return retreivedLyricsData.body.toString();
}
