import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
      requestFullMetadata: false,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
