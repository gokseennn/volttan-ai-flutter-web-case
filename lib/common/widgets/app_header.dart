import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    this.title = 'Image Ai',
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.colorScheme.primary,
      title: Text(
        title,
        style: context.theme.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
