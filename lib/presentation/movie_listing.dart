import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/const/hive_const.dart';
import 'package:flutter_hive_demo/model/movie.dart';
import 'package:flutter_hive_demo/presentation/add_new_movie.dart';
import 'package:flutter_hive_demo/presentation/widgets/movie_display_custom.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box<Movie>(HiveConstants.movieBox).listenable(),
        builder: (context, box, child) {
          return ListView.separated(
            itemCount: box.values.length,
            itemBuilder: (context, i) {

              if(box.values.isEmpty) {
                return Center(
                  child: Text("Empty"),
                );
              }

              Movie item = box.getAt(i);

              return MovieDisplayCustom(movie: item);
            },
            separatorBuilder: (context, i) => Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Add"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddNewMovie())),
      ),
    );
  }
}
