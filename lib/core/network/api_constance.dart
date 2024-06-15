class ApiConstance {
  static const String baseurl = "https://api.themoviedb.org/3";
  static const String nowPlayingMoviesPath =
      "$baseurl/movie/now_playing?api_key=$apiKey";
  static const String PopularMoviesPath =
      "$baseurl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseurl/movie/top_rated?api_key=$apiKey";
}
