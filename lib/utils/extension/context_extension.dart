import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  LinearGradient get primaryGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      theme.colorScheme.primary,
      theme.colorScheme.primary.withValues(alpha: .8),
      theme.colorScheme.secondary,
    ],
    stops: const [0.0, 0.3, 1.0],
  );

  LinearGradient get cardGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      theme.colorScheme.surface.withValues(alpha: 0.08),
      theme.colorScheme.surface.withValues(alpha: 0.04),
    ],
  );

  LinearGradient get buttonGradient => LinearGradient(
    colors: [
      theme.colorScheme.tertiary,
      theme.colorScheme.tertiary.withValues(alpha: 0.8),
    ],
  );

  LinearGradient get headerGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      theme.colorScheme.primary,
      theme.colorScheme.primary.withValues(alpha: 0.95),
    ],
  );

  LinearGradient get textGradient => LinearGradient(
    colors: [
      theme.colorScheme.surface,
      theme.colorScheme.tertiary,
      theme.colorScheme.surface,
    ],
    stops: const [0.0, 0.5, 1.0],
  );

  List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
      blurRadius: 20,
      spreadRadius: 1,
      offset: const Offset(0, 4),
    ),
  ];

  List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.4),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  List<BoxShadow> get imageCardShadow => [
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
      blurRadius: 8,
      spreadRadius: 1,
      offset: const Offset(0, 2),
    ),
  ];

  List<BoxShadow> get dropZoneShadow => [
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.4),
      blurRadius: 30,
      spreadRadius: 3,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.2),
      blurRadius: 50,
      spreadRadius: 5,
      offset: const Offset(0, 20),
    ),
  ];

  List<BoxShadow> get popupShadow => [
    BoxShadow(
      color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
      blurRadius: 20,
      spreadRadius: 1,
      offset: const Offset(0, 4),
    ),
  ];
}
