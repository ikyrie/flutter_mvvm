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
              decoration: InputDecoration(
                hintText: "Pesquisar",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                )
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: MovieCard(),
          ),
          itemCount: 10,
        ),
      ],
    );
  }
}
