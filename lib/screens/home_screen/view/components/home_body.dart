import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:voltran_ai_web/utils/extension/context_extension.dart';
import 'package:voltran_ai_web/utils/extension/responsive_util.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
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
              margin: EdgeInsetsGeometry.only(top: context.mediumPadding),
              child: Text(
                'Unleash Your Creativity with AI-Powered Image Editing',
                style: context.theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: context.smallPadding),
              width: ResponsiveUtil.value(
                xxl: context.width * .4,
                xl: context.width * .4,
                l: context.width * .7,
                m: context.width * .8,
                s: context.width * .9,
              ),
              child: Text(
                'Transform your photos with the magic of artificial intelligence. Upload an image and describe your desired changes to see them come to life.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
