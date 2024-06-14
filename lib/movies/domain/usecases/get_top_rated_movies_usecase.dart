import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/basemovies_repository.dart';

class GetTopMoviesUasecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopMoviesUasecase(this.baseMoviesRepository);
  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}