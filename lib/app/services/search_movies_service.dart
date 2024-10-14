import 'dart:convert';

import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/constants.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchForPopularMovies implements SearchMoviesService {
  List<Movie> movieList = [];
  
  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(Uri.parse(popularMoviesUrl), headers: headers);
      if (response.statusCode == 200) {
        for (dynamic movie in jsonDecode(response.body)["results"]) {
          movieList.add(Movie.fromMap(movie));
        }
        return movieList;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return movieList;
    }
  }
}
