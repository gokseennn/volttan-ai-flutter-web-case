import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/common/widgets/status_popup.dart';
import 'package:voltran_ai_web/utils/extension/file_manager.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<Uint8List?> selectedImagesBytes = <Uint8List?>[].obs;
  final FileManager fileManager = FileManager();
  final promptController = TextEditingController();

  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    scaleAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.1,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOut,
          ),
        );
    animationController.repeat(reverse: true);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> onTapFileSelect() async {
    final files = await fileManager.pickFile(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null) {
      await _loadImageBytes(files);
    }
  }

  Future<void> _loadImageBytes(List<PlatformFile> files) async {
    selectedImagesBytes.clear();
    for (var file in files) {
      selectedImagesBytes.add(file.bytes);
    }
  }

  Future<List<PlatformFile>?> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      return result.files;
    } else {
      Status.error(
        message: 'Dosya Seçilmedi',
      );
      return null;
    }
  }

  void clearFiles() {
    selectedImagesBytes.clear();
  }

  void removeImage(int index) {
    if (index < selectedImagesBytes.length) {
      selectedImagesBytes.removeAt(index);
    }
  }
}
