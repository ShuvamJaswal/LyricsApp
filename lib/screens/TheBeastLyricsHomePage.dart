import 'package:flutter/material.dart';
import 'package:lyrics/functionality/search_lyrics.dart';
import '../widgets/searchResultContainer.dart';

class TheBeastLyricsHomePage extends StatefulWidget {
  @override
  _TheBeastLyricsHomePageState createState() => _TheBeastLyricsHomePageState();
}

class _TheBeastLyricsHomePageState extends State<TheBeastLyricsHomePage> {
  final songFieldInputController = TextEditingController();
  String lyricsUrl = '';
  String lyricsData = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TheBeastLyrics',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchResultContainer(),
            TextField(
              controller: songFieldInputController,
              autofocus: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: "Enter Term to search.",
              ),
            ),
            TextButton(
                onPressed: () async {
                  isLoading = true;
                  lyricsUrl = await songMetadata(songFieldInputController.text);
                  lyricsData = await scrapLyrics(lyricsUrl);

                  setState(() {
                    lyricsData;
                  });
                },
                child: Text("Search")),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                  child: Text(
                lyricsData,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
