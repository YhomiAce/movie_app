// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';
import 'package:movie_app/wigets/tvshow_item.dart';

class TvShows extends StatelessWidget {
  final List movies;
  const TvShows(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ((context, index) => TvShowItem(movies[index])),
            ),
          ),
        ],
      ),
    );
  }
}
