import 'package:flutter/material.dart';
import 'package:movie/view/CreateMovieView.dart';
import 'package:movie/view/ListMoviesView.dart';


var routes = <String, WidgetBuilder>{
  "/movies": (BuildContext context) => new ListMoviesView(),
  "/movies/create": (BuildContext context) => new CreateMovieView(),
};


void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       useMaterial3: true,
       primaryColor: Colors.indigo,
       
      ),
      home: ListMoviesView(),
      routes: routes,
    );
  }
}
