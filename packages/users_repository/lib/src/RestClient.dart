import 'dart:async';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:users_repository/users_repository.dart';

part 'RestClient.g.dart';

@RestApi(
  baseUrl: "http://mobile-test.itfox-web.com:80",
  parser: Parser.JsonSerializable,
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/private/list")
  Future<List<UserData>?> getUsers(@Header('Authorization') String auth);
}

UserData deserializeUserData(Map<String, dynamic> json) =>
    UserData.fromJson(json);
List<UserData> deserializeUserDataList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserData.fromJson(e)).toList();
Map<String, dynamic> serializeTask(UserData object) => object.toJson();
List<Map<String, dynamic>> serializeTaskList(List<UserData> objects) =>
    objects.map((e) => e.toJson()).toList();
