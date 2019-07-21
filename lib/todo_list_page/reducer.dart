import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'todo_component/component.dart';

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{PageAction.initToDos: _initToDosReducer},
  );
}

PageState _initToDosReducer(PageState state, Action action) {
  final List<TodoState> todoList = action.payload ?? <TodoState>[];
  final PageState newState = state.clone();
  newState.todoList = todoList;
  return newState;
}
