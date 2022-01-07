// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['id'] as int?,
      json['name'] as String?,
      json['age'] as int?,
      json['imageUrl'] as String?,
      $enumDecodeNullable(_$UserCardTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'imageUrl': instance.imageUrl,
      'type': _$UserCardTypeEnumMap[instance.type],
    };

const _$UserCardTypeEnumMap = {
  CardType.small: 'SMALL_CARD',
  CardType.big: 'BIG_CARD',
};
