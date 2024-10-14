// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final int id;
  final String cover;
  final String title;
  final String releaseDate;
  final String description;

  Movie({
    required this.id,
    required this.cover,
    required this.title,
    required this.releaseDate,
    required this.description,
  });

  String getImageCoverPath() {
    return 'https://image.tmdb.org/t/p/original/$cover';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cover': cover,
      'title': title,
      'releaseDate': releaseDate,
      'description': description,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      cover: map['poster_path'] as String,
      title: map['title'] as String,
      releaseDate: map['release_date'] as String,
      description: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
