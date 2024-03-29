import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'list_adapter/action.dart' as list_action;
import 'state.dart';
import 'todo_component/component.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<TodoState> initToDos = <TodoState>[
    TodoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    TodoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    TodoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: null)
      .then((dynamic todo) {
    if (todo != null &&
        (todo.title?.isNotEmpty == true || todo.desc?.isNotEmpty == true)) {
      ctx.dispatch(list_action.ToDoListActionCreator.add(todo));
    }
  });
}
