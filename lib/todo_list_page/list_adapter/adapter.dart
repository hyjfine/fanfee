import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/component.dart';
import 'reducer.dart';

class TodoListAdapter extends DynamicFlowAdapter<PageState> {
  TodoListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'todo': TodoComponent(),
          },
          connector: _TodoListConnector(),
          reducer: buildReducer(),
        );
}

class _TodoListConnector extends ConnOp<PageState, List<ItemBean>> {
  @override
  List<ItemBean> get(PageState state) {
    if (state.todoList?.isNotEmpty == true) {
      return state.todoList
          .map<ItemBean>((TodoState data) => ItemBean('todo', data))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(PageState state, List<ItemBean> todoList) {
    if (todoList?.isNotEmpty == true) {
      state.todoList = List<TodoState>.from(
          todoList.map<TodoState>((ItemBean bean) => bean.data).toList());
    } else {
      state.todoList = <TodoState>[];
    }
  }
}
