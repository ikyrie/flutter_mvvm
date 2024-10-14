import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Image.asset("assets/popular.png", width: 80, height: 80,),
        ),
        SliverToBoxAdapter(
          child: Text("Filmes Populares"),
        ),
        SliverToBoxAdapter(
          child: TextField(),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => MovieCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
