part of 'user_selection_bloc.dart';

@immutable
abstract class UserSelectionEvent {}

class UserSelected extends UserSelectionEvent {
  UserSelected(this.userIndex);

  final int userIndex;
}
