import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = <Movie>[];
  
  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService searchForPopular = SearchPopularMoviesService();
    _moviesList = await searchForPopular.getMovies();

    return _moviesList;
  }

  Future<List<Movie>> searchForMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await getPopularMovies();
    } else {
      final SearchMoviesService searchMovie = SearchForMovie(query: query);
      _moviesList = await searchMovie.getMovies();
    }
    
    return _moviesList;
  }

  List<Movie> get moviesList => _moviesList;
}
