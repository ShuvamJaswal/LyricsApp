import 'package:flutter/material.dart';
import 'package:lyrics/widgets/searchResultItem.dart';
import 'package:provider/provider.dart';
import '../providers/search_result_metadata_provider.dart';

class SearchResultContainer extends StatefulWidget {
  @override
  _SearchResultContainerState createState() => _SearchResultContainerState();
}

class _SearchResultContainerState extends State<SearchResultContainer> {
  @override
  Widget build(BuildContext context) {
    final searchData =
        Provider.of<SearchresultMetaDataProvider>(context).searchResults;
    return Expanded(
      child: ListView.builder(
        itemCount: searchData.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          //builder: (c) => products[i],
          value: searchData[index],
          child: Text("hg")//SearchResultItem(searchData[index].songName
              //htfh
              ),
        ),
      ),
    );
  }
}
