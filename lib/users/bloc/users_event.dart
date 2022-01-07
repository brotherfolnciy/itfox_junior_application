part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UsersLoad extends UsersEvent {}

class UsersLoaded extends UsersEvent {
  UsersLoaded(this.users);

  final List<UserData> users;
}

class UsersLoadError extends UsersEvent {}
