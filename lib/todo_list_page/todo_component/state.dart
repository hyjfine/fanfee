import 'package:fish_redux/fish_redux.dart';

class TodoState implements Cloneable<TodoState> {
  String uniqueId;
  String title;
  String desc;
  bool isDone;

  TodoState({this.uniqueId, this.title, this.desc, this.isDone = false}) {
    uniqueId ??= DateTime.now().toIso8601String();
  }

  @override
  TodoState clone() {
    return TodoState()
      ..uniqueId = uniqueId
      ..title = title
      ..desc = desc
      ..isDone = isDone;
  }

  @override
  String toString() {
    return 'ToDoState{uniqueId: $uniqueId, title: $title, desc: $desc, isDone: $isDone}';
  }
}
