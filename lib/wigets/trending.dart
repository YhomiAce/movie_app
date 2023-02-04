// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';
import 'package:movie_app/wigets/trending_item.dart';

class TrendingMovies extends StatelessWidget {
  final List trendings;
  const TrendingMovies(this.trendings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Trending Movies',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendings.length,
              itemBuilder: ((context, index) =>
                  TrendingMovieItem(trendings[index])),
            ),
          ),
        ],
      ),
    );
  }
}
