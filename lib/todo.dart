import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime time;
  Todo({required this.text, required this.time});
}
