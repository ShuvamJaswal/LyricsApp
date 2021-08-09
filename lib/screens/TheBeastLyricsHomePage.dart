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
  bool _isSearchLoading = false;
  void _toggleSearchLoading() {
    setState(() {
      _isSearchLoading = !_isSearchLoading;
    });
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
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
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: _isSearchLoading
                      ? null
                      : () async {
                          _toggleSearchLoading();
                          lyricsUrl = await songMetadata(
                              songFieldInputController.text.trim());
                          lyricsData = await scrapLyrics(lyricsUrl.trim());

                          setState(() {
                            lyricsData;
                          });
                          _toggleSearchLoading();
                        },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: _isSearchLoading
                        ? null
                        : () async {
                            _toggleSearchLoading();
                            lyricsUrl = await songMetadata(
                                songFieldInputController.text.trim());
                            lyricsData = await scrapLyrics(lyricsUrl.trim());

                            setState(() {
                              lyricsData;
                            });
                            _toggleSearchLoading();
                          },
                    child: Column(
                      children: [
                        Text(
                          "Search",
                        ),
                      ],
                    )),
              ],
            ),
            SearchResultContainer(),
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
