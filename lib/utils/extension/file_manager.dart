import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileManager {
  Future<List<PlatformFile>?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 30,
    bool allowMultiple = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
  }) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: Get.theme.colorScheme.surface,
        ),
      ),
      barrierDismissible: false,
    );
    return FilePicker.platform
        .pickFiles(
          dialogTitle: dialogTitle,
          initialDirectory: initialDirectory,
          type: type,
          allowedExtensions: allowedExtensions,
          onFileLoading: onFileLoading,
          compressionQuality: compressionQuality,
          allowMultiple: allowMultiple,
          withData: true,
          withReadStream: withReadStream,
          lockParentWindow: lockParentWindow,
          readSequential: readSequential,
        )
        .then((res) {
          Get.close(closeAll: false, closeDialog: true);
          return res?.files;
        });
  }
}
