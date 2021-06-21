import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
// main() async {
//   // final response = await http
//   //     .get(Uri.parse('https://genius.com/The-chainsmokers-closer-lyrics'));
//   // var document = parse(response.body);
//   // print(document.getElementsByClassName('lyrics')[0].text);

//   var data = await http.get(
//     Uri.parse('https://genius.com/api/search/song?q=closer'),
//   );
//   final url = await jsonDecode(data.body)['response']['sections'][0]['hits'][0]
//       ['result']['path'];
// }
main() async {
  for (var i = 0; i < 10; i++) {
    print(await getBody('https://google.com'));
  }
}

Future<String> getBody(String lyricsUrl) async {
  final response = await http.get(Uri.parse(lyricsUrl));
  return response.body.length.toString();
}
