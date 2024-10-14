import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  final SearchMoviesService searchPopular = SearchForPopularMovies();
  List<Movie> _movieList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async {
    _movieList = await searchPopular.getMovies();
    return _movieList;
  }

  List<Movie> get movieList => _movieList;
}
