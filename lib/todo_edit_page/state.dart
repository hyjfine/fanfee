import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import '../todo_list_page/todo_component/component.dart';

class TodoEditState implements Cloneable<TodoEditState> {
  TodoState todo;

  TextEditingController nameEditController;
  TextEditingController descEditController;

  FocusNode focusNodeName;
  FocusNode focusNodeDesc;

  @override
  TodoEditState clone() {
    return TodoEditState()
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc
      ..todo = todo;
  }
}

TodoEditState initState(TodoState arg) {
  final TodoEditState state = TodoEditState();
  state.todo = arg?.clone() ?? TodoState();
  state.nameEditController = TextEditingController(text: arg?.title);
  state.descEditController = TextEditingController(text: arg?.desc);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();

  return state;
}
