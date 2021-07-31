import 'package:flutter/material.dart';
import 'package:lyrics/widgets/searchResultItem.dart';

class SearchResultContainer extends StatefulWidget {
  @override
  _SearchResultContainerState createState() => _SearchResultContainerState();
}

class _SearchResultContainerState extends State<SearchResultContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 5, itemBuilder: (ctx, index) => SearchResultItem("Sh")),
    );
  }
}
