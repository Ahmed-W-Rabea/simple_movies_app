import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/basemovies_repository.dart';

class GetPopularMoviesUasecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUasecase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
