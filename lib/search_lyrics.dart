import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<String> songMetadata(String searchTerm) async {
  searchTerm = searchTerm.replaceAll(' ', '%20');
  var data = await http.get(
    Uri.parse('https://genius.com/api/search/song?q=$searchTerm'),
  );
  final url = await 'https://genius.com' +
      jsonDecode(data.body)['response']['sections'][0]['hits'][0]['result']
          ['path'];
  print(url);
  return url;
}

Future<String> scrapLyrics(String lyricsUrl) async {
  final response = await http.get(Uri.parse(lyricsUrl));
  var document = parse(response.body);

  return document.getElementsByClassName('lyrics')[0].text;
  //[0].text;
}
