import 'package:json_annotation/json_annotation.dart';

part 'UserAccesToken.g.dart';

@JsonSerializable()
class UserAccesToken {
  String? accessToken;
  UserAccesToken(this.accessToken);
  factory UserAccesToken.fromJson(Map<String, dynamic> json) =>
      _$UserAccesTokenFromJson(json);
}
