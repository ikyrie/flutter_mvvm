import 'package:cinetopia/app/viewmodel/release_movies_viewmodel.dart';
import 'package:flutter/material.dart';

import '../components/movie_card.dart';

class ReleaseMovies extends StatelessWidget {
  ReleaseMovies({super.key});
  final releaseMoviesViewmodel = ReleaseMoviesViewmodel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: releaseMoviesViewmodel.getReleaseMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Image.asset(
                    "assets/release.png",
                    width: 80,
                    height: 80,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Próximos Lançamentos",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: MovieCard(
                      movie: releaseMoviesViewmodel.movieList[index],
                    ),
                  ),
                  itemCount: releaseMoviesViewmodel.movieList.length,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
