import 'package:fish_redux/fish_redux.dart';

enum TodoEditAction { update, onDone, onChangeTheme }

class TodoEditActionCreator {
  static Action update(String name, String desc) {
    return Action(
      TodoEditAction.update,
      payload: <String, String>{
        'name': name,
        'desc': desc,
      },
    );
  }

  static Action onDone() {
    return const Action(TodoEditAction.onDone);
  }

  static Action onChangeTheme() {
    return const Action(TodoEditAction.onChangeTheme);
  }
}
