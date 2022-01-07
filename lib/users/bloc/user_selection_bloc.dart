import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_selection_event.dart';
part 'user_selection_state.dart';

class UserSelectionBloc extends Bloc<UserSelectionEvent, UserSelectionState> {
  UserSelectionBloc() : super(UserSelectionState()) {
    on<UserSelected>(_onUserSelected);
  }

  late int lastSelectedIndex = 0;

  void _onUserSelected(
    UserSelected event,
    Emitter<UserSelectionState> emit,
  ) {
    if (event.userIndex == lastSelectedIndex) {
      _deselectUser(event, emit);
    } else {
      emit(state.copyWith(selectedUserIndex: event.userIndex));
      lastSelectedIndex = event.userIndex;
    }
  }

  void _deselectUser(
    UserSelected event,
    Emitter<UserSelectionState> emit,
  ) {
    emit(state.copyWith(selectedUserIndex: -1));
    lastSelectedIndex = -1;
  }
}
