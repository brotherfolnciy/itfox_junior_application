import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itfox_junior_application/users/users.dart';
import 'package:users_repository/users_repository.dart';

class UsersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<UsersBloc>().add(UsersLoad());
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (previous, current) => previous.users != current.users,
      builder: (context, state) {
        late Set<int> skipIndexes = Set<int>();
        return BlocBuilder<UserSelectionBloc, UserSelectionState>(
          builder: (context, selectionState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (skipIndexes.contains(index)) {
                  return Container();
                }
                var data = state.users[index];
                if (data.type == CardType.small) {
                  if (state.users.length > index + 1) {
                    if (state.users[index + 1].type == CardType.small) {
                      skipIndexes.add(index + 1);
                      return UsersListViewLine(
                        data: UserCardData.fromUserData(
                            state.users[index], index),
                        secondData: UserCardData.fromUserData(
                            state.users[index + 1], index + 1),
                        onTouch: (index) {
                          context
                              .read<UserSelectionBloc>()
                              .add(UserSelected(index));
                        },
                        selectedIndex: selectionState.selectedUserIndex,
                      );
                    } else {
                      return UsersListViewLine(
                        data: UserCardData.fromUserData(
                            state.users[index], index),
                        onTouch: (index) {
                          context
                              .read<UserSelectionBloc>()
                              .add(UserSelected(index));
                        },
                        selectedIndex: selectionState.selectedUserIndex,
                      );
                    }
                  } else {
                    return UsersListViewLine(
                      data:
                          UserCardData.fromUserData(state.users[index], index),
                      onTouch: (index) {
                        context
                            .read<UserSelectionBloc>()
                            .add(UserSelected(index));
                      },
                      selectedIndex: selectionState.selectedUserIndex,
                    );
                  }
                } else if (data.type == CardType.big) {
                  return UsersListViewLine(
                    data: UserCardData.fromUserData(state.users[index], index),
                    onTouch: (index) {
                      context
                          .read<UserSelectionBloc>()
                          .add(UserSelected(index));
                    },
                    selectedIndex: selectionState.selectedUserIndex,
                  );
                } else {
                  return Container();
                }
              },
              itemCount: state.users.length,
            );
          },
        );
      },
    );
  }
}
