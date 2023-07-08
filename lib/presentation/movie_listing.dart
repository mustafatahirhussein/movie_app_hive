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
      appBar: AppBar(
        title: const Text("Movie Listing"),
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box<Movie>(HiveConstants.movieBox).listenable(),
        builder: (context, box, child) {

          return box.values.isEmpty ? const Center(
            child: Text("No Movie Listing!", style: TextStyle(
              fontSize: 32
            ),),
          ) : ListView.separated(
            itemCount: box.values.length,
            itemBuilder: (context, i) {

              Movie item = box.getAt(i);
              return MovieDisplayCustom(movie: item, box: box, index: i);
            },
            separatorBuilder: (context, i) => const Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Add"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddNewMovie())),
      ),
    );
  }

  showUpdateDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(

      );
    });
  }
}
