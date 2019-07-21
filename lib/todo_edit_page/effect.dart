import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import '../todo_list_page/todo_component/component.dart';
import 'action.dart';
import 'state.dart';

Effect<TodoEditState> buildEffect() {
  return combineEffects(<Object, Effect<TodoEditState>>{
    Lifecycle.initState: _init,
    TodoEditAction.onDone: _onDone,
  });
}

void _init(Action action, Context<TodoEditState> ctx) {
  ctx.state.nameEditController.addListener(() {
    ctx.dispatch(
        TodoEditActionCreator.update(ctx.state.nameEditController.text, null));
  });

  ctx.state.descEditController.addListener(() {
    ctx.dispatch(
        TodoEditActionCreator.update(null, ctx.state.descEditController.text));
  });
}

void _onDone(Action action, Context<TodoEditState> ctx) {
  Navigator.of(ctx.context).pop<TodoState>(ctx.state.todo);
}
