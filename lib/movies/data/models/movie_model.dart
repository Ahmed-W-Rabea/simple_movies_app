import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdopPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      backdopPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"]),
      overview: json["overview"],
      voteAverage: json["voteAverage"],
      releaseDate: json["releaseDate"]);
}
