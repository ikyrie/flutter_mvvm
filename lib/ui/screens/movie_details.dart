import 'package:cinetopia/app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF120326),
      body: Center(child: Text(movie.title),),
    );
  }
}
