import 'package:fish_redux/fish_redux.dart';
import 'todo_component/component.dart';

enum PageAction { initToDos, onAdd }

class PageActionCreator {
  static Action initToDosAction(List<TodoState> todoList) {
    return Action(PageAction.initToDos, payload: todoList);
  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
}
