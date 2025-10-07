import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.title = 'Image Ai',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.theme.colorScheme.primary,
            context.theme.colorScheme.primary.withValues(alpha: 0.95),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.smallPadding,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.tertiary.withValues(
                  alpha: 0.1,
                ),
                borderRadius: context.defaultBorderRadius,
                border: Border.all(
                  color: context.theme.colorScheme.tertiary.withValues(
                    alpha: 0.3,
                  ),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.auto_awesome,
                color: context.theme.colorScheme.tertiary,
                size: 24,
              ),
            ),
            Padding(
              padding: context.smallPaddingHorizontal,
              child: Text(
                title,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: context.theme.colorScheme.surface,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
