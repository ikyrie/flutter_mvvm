import 'package:cinetopia/app/viewmodel/upcoming_viewmodel.dart';
import 'package:cinetopia/ui/screens/movie_details.dart';
import 'package:flutter/material.dart';
import '../components/movie_card.dart';
class Upcoming extends StatelessWidget {
  Upcoming({super.key});
  final UpcomingMoviesViewmodel upcomingMoviesViewmodel = UpcomingMoviesViewmodel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: upcomingMoviesViewmodel.getUpcomingMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Image.asset(
                    "assets/upcoming.png",
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails(movie: upcomingMoviesViewmodel.moviesList[index],)));
                      },
                      child: MovieCard(
                          movie: upcomingMoviesViewmodel.moviesList[index])),
                  ),
                  itemCount: upcomingMoviesViewmodel.moviesList.length,
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
