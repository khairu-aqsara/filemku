import 'package:flutter/material.dart';
import 'package:info_filem/view/movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filem Ku',
      home: MovieScreen(),
    );
  }
}
