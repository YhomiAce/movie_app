// ignore_for_file: prefer_const_constructors

import 'package:tmdb_api/tmdb_api.dart';

import '../util/secret.dart';

class Movie {
  Movie();
  final TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(API_KEY, ACCESS_TOKEN),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
  loadTrendingMovies() async {
    Map trendingMovies = await tmdbWithCustomLogs.v3.trending.getTrending();
    // print(trendingMovies['results']);
    return trendingMovies;
  }

  loadTvShows() async {
    Map tvShows = await tmdbWithCustomLogs.v3.tv.getPopular();
    // print(tvShows);
    return tvShows;
  }

  loadTopRatedMovies() async {
    Map tvShows = await tmdbWithCustomLogs.v3.movies.getTopRated();
    print(tvShows);
    return tvShows;
  }
}
