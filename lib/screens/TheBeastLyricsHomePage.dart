import 'package:flutter/material.dart';
import 'package:lyrics/functionality/search_lyrics.dart';
import '../widgets/searchResultContainer.dart';
import '../models/metadata_model.dart';

class TheBeastLyricsHomePage extends StatefulWidget {
  @override
  _TheBeastLyricsHomePageState createState() => _TheBeastLyricsHomePageState();
}

class _TheBeastLyricsHomePageState extends State<TheBeastLyricsHomePage> {
  final _songFieldInputController = TextEditingController();
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
<<<<<<< HEAD
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _songFieldInputController,
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
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: _isSearchLoading
                      ? null
                      : () async {
                          _toggleSearchLoading();
                          MetaDataModel metaData = await songMetadata(
                              _songFieldInputController.text.trim());
                          lyricsUrl = metaData.songUrl;
                          print(metaData.songUrl);
                          lyricsData = await scrapLyrics(lyricsUrl.trim());

                          setState(() {
                            lyricsUrl;
                          });
                          _toggleSearchLoading();
                        },
                  icon: Icon(
                    Icons.search,
                    size: 30,
=======
            SearchResultContainer(),
            TextField(
              controller: songFieldInputController,
              autofocus: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
>>>>>>> parent of 07098bf... added search icon button
                  ),
                ),
                labelText: "Enter Term to search.",
              ),
            ),
<<<<<<< HEAD
            // SearchResultContainer(),
=======
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
>>>>>>> parent of 07098bf... added search icon button
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
