import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = <Movie>[];
  
  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService searchForPopular = SearchPopularMoviesService();
    _moviesList = await searchForPopular.getMovies();

    return _moviesList;
  }

  List<Movie> get moviesList => _moviesList;
}
