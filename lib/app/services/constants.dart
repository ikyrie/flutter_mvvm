import 'package:cinetopia/app/services/api_token.dart';

const String searchMoviesUrl = "https://api.themoviedb.org/3/search/movie?query=";
const String popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

//existe um bug no endpoint do upComing, se colocar ele sem o "region" ele não funciona
const String upComingUrl = "https://api.themoviedb.org/3/movie/upcoming?language=en-US&region=US&page=1";

const String searchFilter = "&include_adult=false&language=en-US&page=1";
const Map<String, String> headers = {
  "accept": 'application/json',
  "Authorization": 'Bearer $token'
};
