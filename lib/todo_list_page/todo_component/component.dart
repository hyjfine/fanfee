import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

export 'state.dart';

class TodoComponent extends Component<TodoState> {
  TodoComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
        );
}
