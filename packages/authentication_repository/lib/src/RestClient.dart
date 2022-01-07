import 'package:authentication_repository/src/models/UserAccesToken.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://mobile-test.itfox-web.com:80")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @FormUrlEncoded()
  @POST("/public/testAuth")
  Future<UserAccesToken> authorize(
    @Field("login") String username,
    @Field("password") String password,
  );
}
