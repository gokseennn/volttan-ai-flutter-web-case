import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/image_card.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';
import 'package:voltran_ai_web/utils/extension/responsive_util.dart';

class SelectedFilesPreviewWidget extends StatelessWidget {
  SelectedFilesPreviewWidget({super.key, required this.controller});
  final HomeController controller;
  final bool isWide = Get.width > 900;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isWide ? context.mediumPadding : 0,
      ),
      width: ResponsiveUtil.value(
        xxl: context.width * .8,
        xl: context.width * .9,
        l: context.width * .95,
        m: context.width * .95,
        s: context.width * .95,
      ),
      height: 450,
      child: Column(
        children: [
          Container(
            padding: context.xsmallPaddingAll,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.theme.colorScheme.surface.withValues(alpha: 0.08),
                  context.theme.colorScheme.surface.withValues(alpha: 0.04),
                ],
              ),
              borderRadius: context.defaultBorderRadius,
              border: Border.all(
                color: context.theme.colorScheme.tertiary.withValues(
                  alpha: 0.2,
                ),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.tertiary.withValues(
                    alpha: 0.1,
                  ),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: context.xsmallPaddingAll,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.tertiary.withValues(
                          alpha: 0.2,
                        ),
                        borderRadius: context.defaultBorderRadius,
                      ),
                      child: Icon(
                        Icons.photo_library_outlined,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.smallPadding),
                      child: Text(
                        'Seçilen Resimler',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.xsmallPadding),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: context.xsmallPadding,
                          horizontal: context.xsmallPadding,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.tertiary.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: context.defaultBorderRadius,
                        ),
                        child: Text(
                          '${controller.selectedImagesBytes.length}',
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: context.smallPaddingHorizontal,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        context.theme.colorScheme.tertiary,
                        context.theme.colorScheme.tertiary.withValues(
                          alpha: 0.8,
                        ),
                      ],
                    ),
                    borderRadius: context.defaultBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: context.theme.colorScheme.tertiary.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: controller.clearFiles,
                    icon: const Icon(
                      Icons.auto_awesome_rounded,
                    ),
                    label: const Text('Tümünü Sil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: context.smallPaddingVertical,
                      shape: RoundedRectangleBorder(
                        borderRadius: context.defaultBorderRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: context.mediumPaddingAll,
              margin: EdgeInsets.only(top: context.smallPadding),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.colorScheme.surface.withValues(alpha: 0.08),
                    context.theme.colorScheme.surface.withValues(alpha: 0.04),
                  ],
                ),
                borderRadius: context.defaultBorderRadius,
                border: Border.all(
                  color: context.theme.colorScheme.tertiary.withValues(
                    alpha: 0.2,
                  ),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.theme.colorScheme.tertiary.withValues(
                      alpha: 0.1,
                    ),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveUtil.value(
                      xxl: 5,
                      xl: 4,
                      l: 4,
                      m: 3,
                      s: 3,
                      xs: 3,
                    ),
                    crossAxisSpacing: context.xsmallPadding,
                    mainAxisSpacing: context.xsmallPadding,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: controller.selectedImagesBytes.length,
                  itemBuilder: (context, index) {
                    return ImageCard(
                      imageBytes: controller.selectedImagesBytes[index]!,
                      controller: controller,
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
