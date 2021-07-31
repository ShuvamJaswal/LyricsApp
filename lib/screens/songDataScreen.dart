import 'package:flutter/material.dart';

class SongDataScreen extends StatefulWidget {
  static const route = '/Song-Data';
  @override
  _SongDataScreenState createState() => _SongDataScreenState();
}

class _SongDataScreenState extends State<SongDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TheBeastLyrics',
          ),
        ),
        body: Container());
  }
}
