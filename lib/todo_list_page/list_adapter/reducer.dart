import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/action.dart' as todo_action;
import '../todo_component/component.dart';
import 'action.dart';

Reducer<PageState> buildReducer() {
  return asReducer(<Object, Reducer<PageState>>{
    ToDoListAction.add: _add,
    todo_action.ToDoAction.remove: _remove
  });
}

PageState _add(PageState state, Action action) {
  final TodoState todo = action.payload;
  final PageState newState = state.clone();
  newState.todoList.add(todo);
  return newState;
}

PageState _remove(PageState state, Action action) {
  final String unique = action.payload;
  final PageState newState = state.clone();
  newState.todoList.removeWhere((TodoState state) => state.uniqueId == unique);
  return newState;
}
