part of 'users_bloc.dart';

class UsersState {
  const UsersState({this.users = const []});

  final List<UserData> users;
  UsersState copyWith({
    List<UserData>? users,
    int? selectedUserIndex,
  }) {
    return UsersState(
      users: users ?? this.users,
    );
  }
}
