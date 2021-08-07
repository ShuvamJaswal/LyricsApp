import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

// Future<String> ly() async {
//   String result = "wait";
//   final response = await http.get(
//     Uri.parse("https://genius.com/The-chainsmokers-closer-lyrics"),
//   );
//   var document = parse(response.body);
//   var abc = [
//     for (var element in document
//         .querySelectorAll("*[class^='ReferentFragment__Highlight-oqvzi6-1']"))
//       for (var a in element.nodes[0].text
//   ];
//   print(abc);
//   return response.body.substring(0, 100);
// //   var document = parse(response.body);

// //   try {
// //     if (response.body.contains("<!doctype")) {
// //       // print(response.body);
// //       var abc = [
// //         for (var element in document.querySelectorAll(
// //             "*[class^='ReferentFragment__Highlight-oqvzi6-1']"))
// //           element.nodes[0].text
// //       ];
// //       return abc.join("\n");
// //       // String abc = document
// //       //     .querySelectorAll("*[class^='ReferentFragment__Highlight-oqvzi6-1']")
// //       //     .forEach((item) =>
// //       //         item.nodes.forEach((element) => element.text.toString()))
// //       //     .toString();
// //       // return abc;

// //       // var abc = [
// //       //   for (var element
// //       //       in document.querySelectorAll("*[class^='Lyrics__Container']"))
// //       //     element.text
// //       // ];
// //       // //  print(document.querySelectorAll("*[class^='Lyrics__Container']")[0].text);
// //       // print("abc");
// //       // return abc.join("\n");
// //     } else {
// //       result = document.getElementsByClassName('lyrics')[0].text;

// //       //[0].text;
// //     }
// //   } catch (Exception, e) {
// //     print(e);
// //     result = "Something went wrong please try again";
// //   }
// //   return result;
// // }
// }

// void main() async {
//   String data = await ly();
//   print(data);
// }

Future<String> ly() async {
  final response = await http
      .get(Uri.parse("https://genius.com/The-chainsmokers-closer-lyrics"));
  //print("${response.body.toString().substring(1, 40)}");
  var document = parse(response.body.replaceAll('<br/>', '\n'));
  //print("parse done");

  return document
      .querySelectorAll("[class*='Lyrics__Root'],div.lyrics")[0]
      .text;
  //print(response.body);
  // print(document.getElementsByClassName('lyrics')[0].text);
  // return document.querySelectorAll("div.lyrics")[0].text;

  //return document.querySelectorAll("div.note, div.alert")[0].text;
  //
  //result =await document.getElementsByClassName('lyrics')[0].text.trim();
  //return document.getElementsByClassName('lyrics')[0].text.trim();
}

void main() async {
  for (var i = 0; i <= 10; i++) {
    String data = await ly();
    print(data);
  }
}
