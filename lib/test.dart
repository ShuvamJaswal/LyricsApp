import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

main() async {
  final response = await http.Client()
      .get(Uri.parse('https://genius.com/The-chainsmokers-closer-lyrics'));
  var document = parse(response.body);
  print(document.getElementsByClassName('lyrics')[0].text);
}
