import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final String songName;
  SearchResultItem(this.songName);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text("$songName"),
        ),
      ),
    );
  }
}
