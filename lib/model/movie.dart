import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie {
  Movie({this.id,this.title,this.thumbnail, this.genre, this.director});
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? thumbnail;

  @HiveField(3)
  String? genre;

  @HiveField(4)
  String? director;
}