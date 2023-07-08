import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hive_demo/const/hive_const.dart';
import 'package:flutter_hive_demo/model/movie.dart';
import 'package:flutter_hive_demo/presentation/add_new_movie.dart';
import 'package:flutter_hive_demo/presentation/movie_listing.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Hive.initFlutter();
  await Hive.openBox<Movie>(HiveConstants.movieBox);
  Hive.registerAdapter(MovieAdapter());
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieListing();
  }
}
