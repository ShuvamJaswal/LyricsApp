import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:lyrics/functionality/search_lyrics.dart';

class TheBeastLyricsHomePage extends StatefulWidget {
  @override
  _TheBeastLyricsHomePageState createState() => _TheBeastLyricsHomePageState();
}

class _TheBeastLyricsHomePageState extends State<TheBeastLyricsHomePage> {
  final songFieldInputController = TextEditingController();
  String lyricsUrl = '';
  String lyricsData = '';
  bool isLoading = false;
  final roundLoadingButtonController = RoundedLoadingButtonController();
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
                labelText: "Enter Term to search.",
              ),
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
    );
  }
}
