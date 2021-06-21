import 'package:flutter/material.dart';
import 'search_lyrics.dart';

void main() {
  runApp(LyricsApp());
}

class LyricsApp extends StatefulWidget {
  @override
  _LyricsAppState createState() => _LyricsAppState();
}

class _LyricsAppState extends State<LyricsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Beast Lyrics",
      home: TheBeastLyricsHomePage(),
    );
  }
}

class TheBeastLyricsHomePage extends StatefulWidget {
  @override
  _TheBeastLyricsHomePageState createState() => _TheBeastLyricsHomePageState();
}

class _TheBeastLyricsHomePageState extends State<TheBeastLyricsHomePage> {
  String songId = '2458848';
  final songFieldInputController = TextEditingController();
  String lyricsUrl = '';
  String lyricsData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TheBeastLyrics',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: songFieldInputController,
              autofocus: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: "Song",
              ),
            ),
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff3779AD),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text("Find Lyrics"),
              onPressed: () async {
                print(songFieldInputController.text.replaceAll(' ', '%20'));
                lyricsUrl = await songMetadata(songFieldInputController.text);
                lyricsData = await scrapLyrics(lyricsUrl);

                setState(() {
                  lyricsData;
                });
              }),
          Expanded(child: SingleChildScrollView(child: Text(lyricsData)))
        ],
      ),
    );
  }
}
