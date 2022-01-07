import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class UsersListViewCheckbox extends StatelessWidget {
  const UsersListViewCheckbox(this.isSelected, {Key? key}) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor('#5DB075'),
                border: Border.all(color: HexColor('#4B9460'))),
            child: Icon(
              Icons.check,
              size: 28,
              color: Colors.white,
            ),
          )
        : Container();
  }
}
