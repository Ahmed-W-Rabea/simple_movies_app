import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_useCase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/basemovies_repository.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  @override
  GetNowPlayingMoviesUsecase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
