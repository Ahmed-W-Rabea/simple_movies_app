class ApiConstance {
  static const String apiKey = "9a1ca7ddaef974173bc9eb5f3f38b3da";
  static const String baseurl = "https://api.themoviedb.org/3";
  static const String nowPlayingMoviesPath =
      "$baseurl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseurl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseurl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int movieId) =>
      "$baseurl/movie/$movieId?api_key=$apiKey";
  static String recommendatiobnPath(int movieId) =>
      "$baseurl/movie/$movieId/recommendations?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}
