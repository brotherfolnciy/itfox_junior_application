import 'dart:async';

import 'package:authentication_repository/src/RestClient.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  String? accessToken;

  final logger = Logger();
  final dio = Dio();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    final client =
        RestClient(dio, baseUrl: "http://mobile-test.itfox-web.com:80");
    await client.authorize(username, password).then((value) {
      _controller.add(AuthenticationStatus.authenticated);
      accessToken = value.accessToken;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
      throw Exception(obj);
    });
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
