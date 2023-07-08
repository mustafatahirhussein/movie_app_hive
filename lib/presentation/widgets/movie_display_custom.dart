import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/model/movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieDisplayCustom extends StatelessWidget {
  const MovieDisplayCustom({
    Key? key,
    required this.movie,
    required this.box,
    required this.index,
  }) : super(key: key);

  final Movie movie;
  final Box<dynamic> box;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.file(
            File(movie.thumbnail!),
            fit: BoxFit.cover,
            height: 100,
            width: 70,
          ),
          SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movie.title!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Genre: ${movie.genre!}"),
              Text("Director: ${movie.director!}"),
            ],
          ),
          Spacer(),

          InkWell(
            onTap: () => box.deleteAt(index),
            child: Container(
              margin: EdgeInsets.only(
                top: 30,
                right: 10,
              ),
              child: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
