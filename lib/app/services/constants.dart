import 'package:cinetopia/app/services/api_token.dart';

const String searchMoviesUrl = "https://api.themoviedb.org/3/search/movie?query=";
const String popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";
const String searchFilter = "&include_adult=false&language=en-US&page=1";
const Map<String, String> headers = {
  "accept": 'application/json',
  "Authorization": 'Bearer $token'
};
