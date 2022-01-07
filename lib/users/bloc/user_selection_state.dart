part of 'user_selection_bloc.dart';

class UserSelectionState {
  const UserSelectionState({this.selectedUserIndex = 0});
  final int selectedUserIndex;

  UserSelectionState copyWith({
    int? selectedUserIndex,
  }) {
    return UserSelectionState(
      selectedUserIndex: selectedUserIndex ?? this.selectedUserIndex,
    );
  }
}
