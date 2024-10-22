import 'package:cinetopia/app/services/release_movies_service.dart';

import '../models/movie.dart';

class ReleaseMoviesViewmodel {
  List<Movie> _movieList = [];

  Future<List<Movie>> getReleaseMovies() async {
    final seachForReleaseMovies = SeachForReleaseMovies();
    _movieList = await seachForReleaseMovies.getMovies();
    return _movieList;
  }

  List<Movie> get movieList => _movieList;

}
