import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';
import 'package:movie_app/screens/movie_description.dart';

class TrendingMovieItem extends StatelessWidget {
  dynamic movie;
  TrendingMovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDescription(movie),
            ));
      },
      child: Container(
        width: 140,
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${movie['poster_path']}'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: CustomText(
                text: movie['title'],
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
