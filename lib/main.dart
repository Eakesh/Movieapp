import 'package:flutter/material.dart';
import './movie_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie Project',
      home: new MovieList(),
    );
  }
}
  // This widget is the root of our application.
