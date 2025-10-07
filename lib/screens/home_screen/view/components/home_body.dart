import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/prompt_input_widget.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/select_file_widget.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/selected_files_preview_widget.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';
import 'package:voltran_ai_web/utils/extension/responsive_util.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: context.height - MediaQuery.of(context).padding.top,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.theme.colorScheme.primary,
              context.theme.colorScheme.primary.withValues(alpha: .8),
              context.theme.colorScheme.secondary,
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: ResponsiveUtil.value(
                xxl: context.width * .60,
                xl: context.width * .5,
                l: context.width * .5,
                m: context.width * .7,
                s: context.width * .9,
              ),
              margin: EdgeInsets.only(top: context.largePadding),
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
                  'Yaratıcılığınızı AI ile Serbest Bırakın',
                  style: context.theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.surface,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: context.mediumPaddingVertical,
              width: ResponsiveUtil.value(
                xxl: context.width * .4,
                xl: context.width * .4,
                l: context.width * .7,
                m: context.width * .8,
                s: context.width * .9,
              ),
              child: Text(
                'Yapay zeka gücüyle fotoğraflarınızı dönüştürün. Bir resim yükleyin ve istediğiniz değişiklikleri tarif edin, hayata geçtiğini görün.',
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.surface.withValues(
                    alpha: 0.9,
                  ),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(
              () {
                final hasImages = controller.selectedImagesBytes.isNotEmpty;
                final isWide = Get.width > 900;
                if (!hasImages) {
                  return Center(
                    child: SelectFileWidget(controller: controller),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(top: context.largePadding),
                  width: ResponsiveUtil.value(
                    xxl: context.width * .85,
                    xl: context.width * .9,
                    l: context.width * .95,
                    m: context.width * .95,
                    s: context.width * .95,
                  ),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: PromptInputWidget(
                                controller: controller,
                              ),
                            ),
                            Expanded(
                              child: SelectedFilesPreviewWidget(
                                controller: controller,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PromptInputWidget(controller: controller),
                            Padding(
                              padding: context.smallPaddingVertical,
                              child: SelectedFilesPreviewWidget(
                                controller: controller,
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
