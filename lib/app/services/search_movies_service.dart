import 'dart:convert';

import 'package:cinetopia/app/consts/services.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  @override
  Future<List<Movie>> getMovies() async {
    final List<Movie> movieList = <Movie>[];

    try {
      final response = await http.get(Uri.parse(popularMoviesUrl), headers: headers,);

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movieList.add(Movie.fromMap(movie));
        }
      }
      return movieList;
    } catch (e) {
      return movieList;
    }
  }
}

class SearchForMovie implements SearchMoviesService {
  String query;

  SearchForMovie({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    final List<Movie> movieList = <Movie>[];

    try {
      final response = await http.get(Uri.parse(searchMovieUrl + query + searchParams), headers: headers,);
      if(response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movieList.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movieList;      
    } catch (e) {
      print(e);
      return movieList;
    }
  }

}
