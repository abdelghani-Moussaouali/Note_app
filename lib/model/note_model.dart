import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  //0
  @HiveField(0)
   String title;
  //1
  @HiveField(1)
   String subtitle;
  //2
  @HiveField(2)
   int color;
  //3
  @HiveField(3)
  final String date;

  NoteModel(
      {required this.title,
      required this.subtitle,
     required this.color,
      required this.date});
}
