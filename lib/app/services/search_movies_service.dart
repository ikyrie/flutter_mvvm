import 'dart:convert';

import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

class SearchMoviesService {
  final popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";
  final searchMoviesUrl = "https://api.themoviedb.org/3/search/movie?query=";
  final searchFilter = "&include_adult=false&language=en-US&page=1";

  List<Movie> movieList = [];

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse(popularMoviesUrl), headers: {
        "accept": 'application/json',
        "Authorization":
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWZjZDQ5NTlhNGExMWZmZWM3MTljYmJjMWQxMmZhOCIsIm5iZiI6MTcyODU3ODAwNi4xNzQzNCwic3ViIjoiNjcwODAwZWJlNDZhMTJhMTk0MWE0NjVhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9._06LTNC6hdVGFU6D8-STJzrArO8NcR8Yrz07Ah-ehDA'
      });
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
