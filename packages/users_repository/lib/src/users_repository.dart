import 'dart:async';

import 'package:dio/dio.dart';
import 'package:users_repository/src/RestClient.dart';

import 'models/models.dart';

class UsersRepository {
  late List<UserData> users = [];

  final dio = Dio();

  Future<List<UserData>> getUsers(String authToken) async {
    if (users.length > 0) return users;
    final _client =
        RestClient(dio, baseUrl: "http://mobile-test.itfox-web.com:80");
    var _users;
    await _client.getUsers("Bearer " + authToken).then((value) {
      if (value != null) {
        _users = value;
        return value;
      } else {
        return [];
      }
    }).catchError((Object obj) {
      print(obj);
      return users;
    });
    users = _users;
    return users;
  }
}
