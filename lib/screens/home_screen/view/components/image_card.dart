import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageBytes,
    required this.controller,
    required this.index,
  });
  final Uint8List imageBytes;
  final HomeController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.defaultBorderRadius,
        border: Border.all(
          color: context.theme.colorScheme.tertiary.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: context.imageCardShadow,
      ),
      child: ClipRRect(
        borderRadius: context.defaultBorderRadius,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.memory(
                imageBytes,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: context.theme.colorScheme.errorContainer,
                    child: Icon(
                      Icons.broken_image,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: InkWell(
                onTap: () => controller.removeImage(index),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.error.withValues(
                      alpha: 0.8,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
