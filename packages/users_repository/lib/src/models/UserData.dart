import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

enum CardType {
  @JsonValue("SMALL_CARD")
  small,
  @JsonValue("BIG_CARD")
  big
}

@JsonSerializable()
class UserData {
  UserData(this.id, this.name, this.age, this.imageUrl, this.type);

  int? id;
  String? name;
  int? age;
  String? imageUrl;
  CardType? type;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
