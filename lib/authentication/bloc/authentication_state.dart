part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.accessToken = '',
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(String accessToken)
      : this._(
            status: AuthenticationStatus.authenticated,
            accessToken: accessToken);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.invalid()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final String accessToken;

  @override
  List<Object> get props => [status, accessToken];
}
