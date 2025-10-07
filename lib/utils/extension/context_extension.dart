import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

extension ContextExtension on BuildContext {
  double get smallPadding => 18;
  double get mediumPadding => 48;
  double get largePadding => 64;
  double get xlargePadding => 96;

  EdgeInsetsGeometry get smallPaddingAll => EdgeInsets.all(smallPadding);
  EdgeInsetsGeometry get mediumPaddingAll => EdgeInsets.all(mediumPadding);
  EdgeInsetsGeometry get largePaddingAll => EdgeInsets.all(largePadding);
  EdgeInsetsGeometry get xlargePaddingAll => EdgeInsets.all(xlargePadding);

  EdgeInsetsGeometry get smallPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: smallPadding);
  EdgeInsetsGeometry get mediumPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumPadding);
  EdgeInsetsGeometry get largePaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: largePadding);
  EdgeInsetsGeometry get xlargePaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: xlargePadding);

  EdgeInsetsGeometry get smallPaddingVertical =>
      EdgeInsets.symmetric(vertical: smallPadding);
  EdgeInsetsGeometry get mediumPaddingVertical =>
      EdgeInsets.symmetric(vertical: mediumPadding);
  EdgeInsetsGeometry get largePaddingVertical =>
      EdgeInsets.symmetric(vertical: largePadding);
  EdgeInsetsGeometry get xlargePaddingVertical =>
      EdgeInsets.symmetric(vertical: xlargePadding);

  ButtonStyle get maxWidthButtonStyle => ButtonStyle(
    minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 48)),
  );

  BoxShadow get defaultBoxShadow => BoxShadow(
    color: theme.colorScheme.secondary,
    spreadRadius: 0,
    offset: const Offset(0, 0),
  );

  BoxBorder get defaultBorderAll => Border.all(color: Colors.white, width: 0);
}
