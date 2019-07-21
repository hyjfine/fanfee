import 'package:fish_redux/fish_redux.dart';
import '../todo_component/component.dart';

enum ToDoListAction { add }

class ToDoListActionCreator {
  static Action add(TodoState state) {
    return Action(ToDoListAction.add, payload: state);
  }
}
