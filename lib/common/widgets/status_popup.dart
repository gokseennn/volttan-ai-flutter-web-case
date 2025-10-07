import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Status {
  static void show({
    required String message,
    required DialogType type,
    Duration duration = const Duration(seconds: 1),
    TextStyle? textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  }) {
    Get.dialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      UnconstrainedBox(
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          insetAnimationDuration: const Duration(milliseconds: 100),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: type.getGradient(),
              boxShadow: [
                BoxShadow(
                  color: type.getBackgroundColor().withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    type.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    style: textStyle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Future.delayed(
      duration,
      () {
        if (Get.isDialogOpen ?? false) {
          Get.close(closeAll: false);
        }
      },
    );
  }

  static void success({
    String? message,
    Duration? duration,
    TextStyle? textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  }) {
    show(
      message: message ?? "SUCCESS".tr,
      type: DialogType.success,
      duration: duration ?? 1.seconds,
      textStyle: textStyle,
    );
  }

  static void error({
    String? message,
    Duration? duration,
    TextStyle? textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  }) {
    show(
      message: message ?? "ERROR".tr,
      type: DialogType.error,
      duration: duration ?? 1.seconds,
      textStyle: textStyle,
    );
  }
}

enum DialogType {
  success(Icons.check_circle),
  error(Icons.error);

  final IconData icon;

  const DialogType(this.icon);

  Color getBackgroundColor() {
    switch (this) {
      case DialogType.success:
        return Get.theme.colorScheme.tertiary;
      case DialogType.error:
        return Get.theme.colorScheme.tertiary;
    }
  }

  LinearGradient getGradient() {
    switch (this) {
      case DialogType.success:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Get.theme.colorScheme.tertiary,
            Get.theme.colorScheme.tertiary.withValues(alpha: 0.8),
            Get.theme.colorScheme.tertiary.withValues(alpha: 0.6),
          ],
        );
      case DialogType.error:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Get.theme.colorScheme.tertiary,
            Get.theme.colorScheme.tertiary.withValues(alpha: 0.8),
            Get.theme.colorScheme.tertiary.withValues(alpha: 0.6),
          ],
        );
    }
  }
}
