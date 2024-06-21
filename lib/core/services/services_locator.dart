import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/basemovies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_uasecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUasecase(sl()));
    sl.registerLazySingleton(() => GetTopMoviesUasecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));

    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
