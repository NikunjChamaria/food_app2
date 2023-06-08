import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';

class IconTab extends StatelessWidget {
  final IconData iconData;
  final Color color;
  const IconTab({super.key, required this.iconData, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width10 * 6,
      height: Dimensions.height10 * 5,
      padding: EdgeInsets.all(Dimensions.height10),
      margin: EdgeInsets.only(
          right: Dimensions.width10 / 2, left: Dimensions.width10 / 2),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(Dimensions.height10 / 2)),
      child: Center(
          child: Icon(
        iconData,
        color: color,
      )),
    );
  }
}
