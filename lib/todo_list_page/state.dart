import 'package:fish_redux/fish_redux.dart';

import 'report_component/component.dart';
import 'todo_component/component.dart';

class PageState implements Cloneable<PageState> {
  List<TodoState> todoList;

  @override
  PageState clone() {
    return PageState()..todoList = todoList;
  }
}

PageState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return PageState();
}

class ReportConnector extends Reselect2<PageState, ReportState, int, int> {
  @override
  ReportState computed(int sub0, int sub1) {
    return ReportState()
      ..done = sub0
      ..total = sub1;
  }

  @override
  int getSub0(PageState state) {
    return state.todoList.where((TodoState tds) => tds.isDone).toList().length;
  }

  @override
  int getSub1(PageState state) {
    return state.todoList.length;
  }

  @override
  void set(PageState state, ReportState subState) {
    throw Exception('Unexcepted to set PageState from ReportState');
  }
}
