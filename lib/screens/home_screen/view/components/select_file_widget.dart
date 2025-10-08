import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';
import 'package:voltran_ai_web/utils/extension/responsive_util.dart';

class SelectFileWidget extends StatelessWidget {
  const SelectFileWidget({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.scaleAnimation.value,
          child: InkWell(
            onTap: controller.onTapFileSelect,
            borderRadius: context.defaultBorderRadius,
            child: Container(
              margin: EdgeInsets.only(
                top: context.largePadding,
                bottom: context.largePadding,
              ),
              width: ResponsiveUtil.value(
                xxl: context.width * .6,
                xl: context.width * .7,
                l: context.width * .8,
                m: context.width * .9,
                s: context.width * .95,
              ),
              height: ResponsiveUtil.value(
                xxl: 450,
                xl: 400,
                l: 350,
                m: 300,
                s: 250,
              ),
              decoration: BoxDecoration(
                borderRadius: context.defaultBorderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.colorScheme.secondary,
                    context.theme.colorScheme.secondary.withValues(
                      alpha: 0.6,
                    ),
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.primary.withValues(alpha: 0.6),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
                border: Border.all(
                  color: context.theme.colorScheme.tertiary.withValues(
                    alpha: 0.3,
                  ),
                  width: 2,
                ),
                boxShadow: context.dropZoneShadow,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: context.smallPaddingAll,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          context.theme.colorScheme.tertiary.withValues(
                            alpha: 0.3,
                          ),
                          context.theme.colorScheme.tertiary.withValues(
                            alpha: 0.1,
                          ),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.7, 1.0],
                      ),
                      boxShadow: context.imageCardShadow,
                    ),
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      size: ResponsiveUtil.value(
                        xxl: 90,
                        xl: 80,
                        l: 70,
                        m: 60,
                        s: 50,
                      ),
                      color: context.theme.colorScheme.tertiary,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: context.smallPadding),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          context.theme.colorScheme.surface,
                          context.theme.colorScheme.tertiary,
                          context.theme.colorScheme.surface,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ).createShader(bounds),
                      child: Text(
                        'Resimlerinizi Yükleyin',
                        style: context.theme.textTheme.headlineSmall?.copyWith(
                          color: context.theme.colorScheme.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.smallPadding),
                    child: Text(
                      'AI ile düzenlemek istediğiniz resimleri seçin',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.surface.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.smallPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: context.buttonGradient,
                        borderRadius: context.defaultBorderRadius,
                        boxShadow: context.buttonShadow,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: controller.onTapFileSelect,
                        icon: const Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 22,
                        ),
                        label: const Text(
                          'Dosya Seç',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mediumPadding,
                            vertical: context.smallPadding,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: context.defaultBorderRadius,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.smallPaddingAll,
                    child: Text(
                      'JPG, PNG, GIF formatları desteklenir',
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.surface.withValues(
                          alpha: 0.6,
                        ),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
