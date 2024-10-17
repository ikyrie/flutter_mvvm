import 'package:cinetopia/app/viewmodel/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:cinetopia/ui/screens/movie_details.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {

  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel searchMoviesViewmodel = SearchMoviesViewmodel();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchMoviesViewmodel.searchForMovie(searchController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/popular.png",
                  width: 80,
                  height: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Filmes Populares",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: TextField(
                    controller: searchController,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      setState(() { });
                    },
                    decoration: InputDecoration(
                      hintText: "Pesquisar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
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
                                builder: (context) => MovieDetails(movie: searchMoviesViewmodel.moviesList[index],)));
                      },
                      child: MovieCard(
                          movie: searchMoviesViewmodel.moviesList[index])),
                ),
                itemCount: searchMoviesViewmodel.moviesList.length,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
