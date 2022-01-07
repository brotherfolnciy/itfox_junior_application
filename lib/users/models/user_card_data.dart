import 'package:users_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class UserCardData {
  UserCardData(this.imageUrl, this.type, this.index);

  late int index;
  final String? imageUrl;
  final UserCardType? type;

  factory UserCardData.fromUserData(UserData data, int index) {
    UserCardType cardType;

    switch (data.type) {
      case CardType.small:
        cardType = UserCardType.small;
        break;
      case CardType.big:
        cardType = UserCardType.big;
        break;
      default:
        cardType = UserCardType.big;
    }

    return UserCardData(
      data.imageUrl,
      cardType,
      index,
    );
  }
}

enum UserCardType { small, big }
