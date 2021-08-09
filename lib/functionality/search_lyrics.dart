import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
<<<<<<< HEAD
import 'package:lyrics/models/metadata_model.dart';

Future<MetaDataModel> songMetadata(String searchTerm) async {
  if (searchTerm != "") {
    searchTerm = searchTerm.replaceAll(' ', '%20');

    var response = await http.get(
      Uri.parse('https://genius.com/api/search/song?q=$searchTerm'),
    );

    if (response.statusCode == 200) {
      print(MetaDataModel.fromJson(jsonDecode(response.body)).songUrl);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MetaDataModel.fromJson(jsonDecode(response.body));
      // final url = jsonDecode(data.body)['response']['sections'][0]['hits'][0]['result']['path'];
      // return url;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
=======

Future<String> songMetadata(String searchTerm) async {
  searchTerm = searchTerm.replaceAll(' ', '%20');
  var data = await http.get(
    Uri.parse('https://genius.com/api/search/song?q=$searchTerm'),
  );
  final url = jsonDecode(data.body)['response']['sections'][0]['hits'][0]
      ['result']['path'];
  return url;
>>>>>>> parent of 07098bf... added search icon button
}

Future<String> scrapLyrics(String lyricsUrl) async {
  String result = "wait";
  final response = await http.get(Uri.parse("https://genius.com" + lyricsUrl));
  var document = parse(response.body.replaceAll('<br/>', '\n'));
  try {
    return document
        .querySelectorAll("[class*='Lyrics__Root'],div.lyrics")[0]
        .text;
  } catch (Exception, e) {
    print(e);
    return "Something went wrong please try again";
  }
}



/*

older parsing code(before try)
var document = parse(response.body);
OLDER TRY CODE

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

*/