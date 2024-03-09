import 'package:Qaree/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:Qaree/utils/theme/extensions.dart';

AppBar CustomAppBar({
  required BuildContext context,
  String? title,
  Color? backgroundColor,
  IconData? rightButtonIcon,
  VoidCallback? onRightButtonPressed,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: backgroundColor ?? ColorsConst.lightGrey,
    title: Text(
      title ?? "",
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontFamily: "Almarai",
            color: Colors.black, // Adjusted for clarity
          ),
    ),
    actions: rightButtonIcon != null
        ? [
            IconButton(
              icon: Icon(rightButtonIcon, color: ColorsConst.primaryPurple), // Adjusted for clarity
              onPressed: onRightButtonPressed,
            )
          ]
        : null,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
  );
}
