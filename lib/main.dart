import 'package:flutter/material.dart';

import 'screens/TheBeastLyricsHomePage.dart';

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
