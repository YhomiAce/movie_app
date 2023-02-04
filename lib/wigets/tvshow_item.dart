import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';
import 'package:movie_app/screens/movie_description.dart';

class TvShowItem extends StatelessWidget {
  dynamic movie;
  TvShowItem(this.movie, {super.key});

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
        padding: EdgeInsets.all(5),
        width: 250,
        child: Column(
          children: [
            Container(
              width: 250,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${movie['backdrop_path'] ?? movie['poster_path']}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: CustomText(
                text: movie['original_name'],
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
