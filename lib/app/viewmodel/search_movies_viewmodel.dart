import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _movieList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService searchPopular = SearchForPopularMovies();
    _movieList = await searchPopular.getMovies();
    return _movieList;
  }

  Future<List<Movie>> searchForMovie(String query) async {
    if (query.isEmpty) {
      _movieList = await getPopularMovies();
    } else {
      final SearchMoviesService searchMovie = SearchForMovie(query: query);
      _movieList = await searchMovie.getMovies();
    }
    return _movieList;
  }

  List<Movie> get movieList => _movieList;
}
