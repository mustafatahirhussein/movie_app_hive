import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/const/hive_const.dart';
import 'package:flutter_hive_demo/model/movie.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class AddNewMovie extends StatefulWidget {
  const AddNewMovie({Key? key}) : super(key: key);

  @override
  State<AddNewMovie> createState() => _AddNewMovieState();
}

class _AddNewMovieState extends State<AddNewMovie> {
  TextEditingController? titleC, genreC, directorC;

  String? moviePath;

  @override
  void initState() {
    // TODO: implement initState

    titleC = TextEditingController();
    genreC = TextEditingController();
    directorC = TextEditingController();

    moviePath = "";
    super.initState();
  }

  dynamic addMoviePicture() async {
    PickedFile? pf = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pf!.path.isNotEmpty) {
      setState(() {
        moviePath = pf.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () => addMoviePicture(),
            child: moviePath!.isNotEmpty
                ? Container(
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(File(moviePath!), fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.camera, size: 70),
                    ),
                  ),
          ),
          buildField(titleC!, 'Movie Title'),
          buildField(genreC!, 'Movie Genre'),
          buildField(directorC!, 'Movie Director'),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 45),
            child: ElevatedButton(
              child: const Text("Add Movie"),
              onPressed: () async {
                Box movieBox = Hive.box<Movie>(HiveConstants.movieBox);

                await movieBox.put(
                  DateTime.now().toString(),
                  Movie(
                    title: titleC!.text,
                    thumbnail: moviePath,
                    genre: genreC!.text,
                    director: directorC!.text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildField(TextEditingController controller, String hint) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hint,
          ),
        ),
      );
}
