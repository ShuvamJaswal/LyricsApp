import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/search_result_metadata_model.dart';
import 'package:http/http.dart' as http;

class SearchresultMetaDataProvider extends ChangeNotifier {
  List<SearchResultMetaDataModel> _searchResultsList = [];
  List<SearchResultMetaDataModel> get searchResults {
    return [..._searchResultsList];
  }

  void addTask(String newTaskTitle) {
    final task = SearchResultMetaDataModel();
    _searchResultsList.add(task);
    notifyListeners();
  }

  Future<void> fetchAndSetResults() async {
    const url = 'https://genius.com/api/search/song?q=closer';

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<SearchResultMetaDataModel> loadedSearchResults = [];
      extractedData.forEach((prodId, metaData) {
        loadedSearchResults.add(SearchResultMetaDataModel(
          songUrl: metaData['response']['sections'][0]['hits'][0]['result']
              ['path'],
          songId: metaData['response']['sections'][0]['hits'][0]['result']['id']
              .toString(),
          songName: metaData['response']['sections'][0]['hits'][0]['result']
              ['full_title'],
        ));
      });

      _searchResultsList = loadedSearchResults;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
