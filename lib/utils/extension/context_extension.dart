import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get xsmallPadding => 12;
  double get smallPadding => 18;
  double get mediumPadding => 32;
  double get largePadding => 48;
  double get xlargePadding => 64;

  EdgeInsetsGeometry get xsmallPaddingAll => EdgeInsets.all(xsmallPadding);
  EdgeInsetsGeometry get smallPaddingAll => EdgeInsets.all(smallPadding);
  EdgeInsetsGeometry get mediumPaddingAll => EdgeInsets.all(mediumPadding);
  EdgeInsetsGeometry get largePaddingAll => EdgeInsets.all(largePadding);
  EdgeInsetsGeometry get xlargePaddingAll => EdgeInsets.all(xlargePadding);

  EdgeInsetsGeometry get xsmallPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: xsmallPadding);
  EdgeInsetsGeometry get smallPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: smallPadding);
  EdgeInsetsGeometry get mediumPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumPadding);
  EdgeInsetsGeometry get largePaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: largePadding);
  EdgeInsetsGeometry get xlargePaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: xlargePadding);

  EdgeInsetsGeometry get xsmallPaddingVertical =>
      EdgeInsets.symmetric(vertical: xsmallPadding);
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

  BorderRadius get defaultBorderRadius => BorderRadius.circular(8);
}
