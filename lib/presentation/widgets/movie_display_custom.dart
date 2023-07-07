import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/model/movie.dart';

class MovieDisplayCustom extends StatelessWidget {
  const MovieDisplayCustom({Key? key, required this.movie,}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.file(File(movie.thumbnail!), fit: BoxFit.contain, height: 60, width: 80,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(movie.title!, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),

            Text(movie.genre!),
            Text(movie.director!),
          ],
        ),
      ],
    );
  }
}
