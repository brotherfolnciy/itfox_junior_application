import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'ServerResponse.g.dart';

@JsonSerializable()
class ServerResponse {
  const ServerResponse(this.users);

  final List<UserData>? users;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
}
