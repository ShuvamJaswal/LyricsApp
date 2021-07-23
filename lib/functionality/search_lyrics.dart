import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<String> songMetadata(String searchTerm) async {
  searchTerm = searchTerm.replaceAll(' ', '%20');
  var data = await http.get(
    Uri.parse('https://genius.com/api/search/song?q=$searchTerm'),
  );
  final url = jsonDecode(data.body)['response']['sections'][0]['hits'][0]
      ['result']['path'];
  return url;
}

Future<String> scrapLyrics(String lyricsUrl) async {
  String result = "wait";
  final response = await http.get(Uri.parse("https://genius.com" + lyricsUrl));
  var document = parse(response.body);
  try {
    if (response.body.contains("<!doctype")) {
      var abc = [
        for (var element in document.querySelectorAll(
            "*[class^='ReferentFragment__Highlight-oqvzi6-1']"))
          for (var a in element.nodes) a.text
      ];
      print(abc.join("\n"));
      // var abc = [

      //   for (var element
      //       in document.querySelectorAll("*[class^='Lyrics__Container']"))
      //     element.text
      // ];

      return abc
          .join("\n")
          .replaceAll(RegExp(r'[\n]+'), '\n')
          .replaceAll(RegExp(r'[\\(\\)]'), '')
          .trim();
    } else {
      result = document.getElementsByClassName('lyrics')[0].text.trim();
    }
  } catch (Exception, e) {
    print(e);
    result = "Something went wrong please try again";
  }
  return result;
}
