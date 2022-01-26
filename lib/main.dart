import 'package:flutter/material.dart';
import 'package:movie_listing/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Movie List Demo',
      home: MovieList(),
    );
  }
}
