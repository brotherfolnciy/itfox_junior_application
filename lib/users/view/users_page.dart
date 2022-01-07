import 'package:authentication_repository/authentication_repository.dart';
import 'package:itfox_junior_application/authentication/bloc/authentication_bloc.dart';
import 'package:itfox_junior_application/users/bloc/user_selection_bloc.dart';
import 'package:users_repository/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itfox_junior_application/users/users.dart';

class UsersPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UsersPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UsersBloc>(
              create: (_) => UsersBloc(
                usersRepository:
                    RepositoryProvider.of<UsersRepository>(context),
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              ),
            ),
            BlocProvider<UserSelectionBloc>(
              create: (_) => UserSelectionBloc(),
            ),
          ],
          child: UsersListView(),
        ),
      ),
    );
  }
}
