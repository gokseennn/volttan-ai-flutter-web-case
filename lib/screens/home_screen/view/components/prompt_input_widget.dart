import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';

class PromptInputWidget extends StatelessWidget {
  PromptInputWidget({super.key, required this.controller});
  final HomeController controller;
  final bool isWide = Get.width > 900;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.xsmallPaddingAll,
      margin: EdgeInsets.only(
        right: isWide ? context.mediumPadding : 0,
      ),
      height: 450,
      decoration: BoxDecoration(
        gradient: context.cardGradient,
        borderRadius: context.defaultBorderRadius,
        border: Border.all(
          color: context.theme.colorScheme.tertiary.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Icons.edit_note_outlined,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.smallPadding),
                child: Text(
                  'AI Prompt',
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    color: context.theme.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.mediumPadding),
          Container(
            decoration: BoxDecoration(
              borderRadius: context.defaultBorderRadius,
              border: Border.all(
                color: context.theme.colorScheme.surface.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller.promptController,
              maxLines: 8,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.surface,
              ),
              decoration: InputDecoration(
                hintText:
                    'İstediğin düzenlemeyi yaz...\n\nÖrnekler:\n• Arka planı sil ve beyaz yap\n• Göz rengini mavi yap\n• Saç stilini değiştir',
                hintStyle: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.surface.withValues(
                    alpha: 0.6,
                  ),
                ),
                filled: true,
                fillColor: context.theme.colorScheme.surface.withValues(
                  alpha: 0.05,
                ),
                border: OutlineInputBorder(
                  borderRadius: context.defaultBorderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.defaultBorderRadius,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.defaultBorderRadius,
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.tertiary,
                    width: 2,
                  ),
                ),
                contentPadding: context.smallPaddingAll,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: context.smallPadding),
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
              boxShadow: context.imageCardShadow,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.auto_awesome_rounded,
              ),
              label: const Text('AI ile Uygula'),
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
    );
  }
}
