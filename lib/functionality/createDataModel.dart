// import '../models/metadata_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<MetaDataModel> fetchMetaData() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     return MetaDataModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
