import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texi/core/utils/image_picker_service.dart';

class FrontIdentificationNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final frontIdentificationProvider =
    NotifierProvider<FrontIdentificationNotifier, AsyncValue<File?>>(
      FrontIdentificationNotifier.new,
    );

class BackIdentificationNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final backIdentificationProvider =
    NotifierProvider<BackIdentificationNotifier, AsyncValue<File?>>(
      BackIdentificationNotifier.new,
    );
