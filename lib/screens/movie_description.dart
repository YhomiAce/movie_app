// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/common/custom_text.dart';

class MovieDescription extends StatelessWidget {
  dynamic movie;
  MovieDescription(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: movie['title'] ?? movie['original_name'],
          color: Colors.white,
          size: 17,
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: CustomText(
                      text: '⭐ Rating - ${movie['vote_average']}',
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: CustomText(
                text: movie['title'] ?? movie['original_name'],
                color: Colors.white,
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: CustomText(
                text:
                    'Releasing On- ${movie['release_date'] ?? movie['first_air_date']}',
                size: 14,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie['backdrop_path']}'),
                ),
                Flexible(
                  child: Container(
                    child: CustomText(
                      text: movie['overview'],
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
