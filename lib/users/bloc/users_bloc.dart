import 'package:bloc/bloc.dart';
import 'package:users_repository/users_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required usersRepository, required authenticationRepository})
      : _usersRepository = usersRepository,
        _authenticationRepository = authenticationRepository,
        super(const UsersState()) {
    on<UsersLoad>(_onUsersLoad);
    on<UsersLoaded>(_onUsersLoaded);
    on<UsersLoadError>(_onUsersLoadError);
  }

  final UsersRepository _usersRepository;
  final AuthenticationRepository _authenticationRepository;

  void _onUsersLoad(
    UsersLoad event,
    Emitter<UsersState> emit,
  ) async {
    final accessToken = _authenticationRepository.accessToken;
    await _usersRepository.getUsers(accessToken!).then((value) {
      print(value.length);
      _onUsersLoaded(UsersLoaded(value), emit);
    }).catchError((Object obj) {
      print(obj.toString());
      _onUsersLoadError(UsersLoadError(), emit);
    });
  }

  void _onUsersLoaded(
    UsersLoaded event,
    Emitter<UsersState> emit,
  ) {
    emit(state.copyWith(users: event.users));
  }

  void _onUsersLoadError(
    UsersLoadError event,
    Emitter<UsersState> emit,
  ) {}
}
