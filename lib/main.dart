// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';
import 'package:movie_app/wigets/top_rated.dart';
import 'package:movie_app/wigets/trending.dart';
import 'package:movie_app/wigets/tvshows.dart';
import './services/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List tvShows = [];
  List topRated = [];
  Movie movies = Movie();

  getTrendingMovies() async {
    final trending = await movies.loadTrendingMovies();
    setState(() {
      trendingMovies = trending['results'];
    });
  }

  getTvShows() async {
    final trending = await movies.loadTvShows();
    setState(() {
      tvShows = trending['results'];
    });
  }

  getTopRatedMovies() async {
    final trending = await movies.loadTopRatedMovies();
    setState(() {
      topRated = trending['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getTrendingMovies();
    getTvShows();
    getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const CustomText(
          text: 'Xpress  Movies ❤️',
          color: Colors.white,
          size: 18,
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(
              trendingMovies.where((item) => item['title'] != null).toList()),
          TopRatedMovies(
              topRated.where((item) => item['title'] != null).toList()),
          TvShows(
              tvShows.where((item) => item['original_name'] != null).toList()),
        ],
      ),
    );
  }
}
