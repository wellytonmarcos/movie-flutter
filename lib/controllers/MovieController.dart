import 'package:json_helpers/json_helpers.dart';
import 'package:movie/models/MovieModel.dart';
import 'package:http/http.dart' as http;
import 'package:movie/constants/constants.dart';
import 'dart:convert';

class MovieController {
  Future<List> getMovies() async {
    var urlSegment = 'movies';
    var url = apiUrl + urlSegment;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<MovieModel> movies =
          List<MovieModel>.from(l.map((model) => MovieModel.fromJson(model)));

      return movies;
    } else {
      throw Exception('Failed to load list movies');
    }
  }

  Future<MovieModel> getMovie(id) async {
    var urlSegment = 'movies/$id';
    var url = apiUrl + urlSegment;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<bool> insertMovie(String name) async {
    var urlSegment = 'movies';
    var url = apiUrl + urlSegment;
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'name': name}));

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      throw Exception('Failed to load list movies');
    }
  }
}
