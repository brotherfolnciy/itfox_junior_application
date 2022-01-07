import 'package:flutter/material.dart';
import 'package:itfox_junior_application/users/users.dart';
import 'package:extended_image/extended_image.dart';
import 'package:itfox_junior_application/users/view/users_list_checkbox.dart';

class UsersListViewLine extends StatelessWidget {
  const UsersListViewLine(
      {required this.data,
      this.secondData,
      Key? key,
      required this.onTouch,
      required this.selectedIndex})
      : super(key: key);

  final UserCardData data;
  final UserCardData? secondData;

  final int selectedIndex;

  final double _cardPadding = 7.5;

  final double _smallCardHeight = 190;
  final double _bigCardHeight = 300;

  final Function(int) onTouch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: data.type == UserCardType.big
          ? EdgeInsets.all(_cardPadding)
          : EdgeInsets.zero,
      height: data.type == UserCardType.big ? _bigCardHeight : _smallCardHeight,
      child: data.type == UserCardType.big
          ? UsersListViewItem(
              data,
              selectedIndex == data.index,
              onTouch: onTouch,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(_cardPadding),
                    height: _smallCardHeight,
                    child: UsersListViewItem(
                      data,
                      selectedIndex == data.index,
                      onTouch: onTouch,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: secondData != null
                      ? Container(
                          padding: EdgeInsets.all(_cardPadding),
                          height: _smallCardHeight,
                          child: UsersListViewItem(
                            secondData!,
                            selectedIndex == secondData?.index,
                            onTouch: onTouch,
                          ),
                        )
                      : Container(
                          height: _smallCardHeight,
                        ),
                ),
              ],
            ),
    );
  }
}

class UsersListViewItem extends StatelessWidget {
  const UsersListViewItem(this.data, this.isSelected,
      {Key? key, required this.onTouch})
      : super(key: key);

  final UserCardData data;

  final bool isSelected;

  final double _cardBorderRadius = 20;

  final Function(int) onTouch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _usersListItemDecoration(_cardBorderRadius),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              onTouch(data.index);
            },
            child: Container(
              height: double.infinity,
              child: ExtendedImage.network(
                data.imageUrl!,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(_cardBorderRadius),
                fit: BoxFit.cover,
              ),
            ),
          ),
          isSelected
              ? Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 17, right: 20),
                  child: UsersListViewCheckbox(isSelected),
                )
              : Container(),
        ],
      ),
    );
  }

  BoxDecoration _usersListItemDecoration(double borderRadius) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.75),
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
