import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_useCase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_uasecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUasecase getPopularMoviesUasecase;
  final GetTopMoviesUasecase getTopMoviesUasecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUasecase,
      this.getTopMoviesUasecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUasecase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, populareMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopMoviesUasecase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }
}
