import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// Controller
class PhotoController extends GetxController {
  final RxBool selectedImage = false.obs;
  final Rx<File?> image = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 1000,
        maxWidth: 1000,
        imageQuality: 100,
      );
      if (pickedImage != null) {
        image.value = File(pickedImage.path);
        selectedImage.value = true;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error picking image: ${e.toString()}');
    }
  }

  Future<void> captureImageFromCamera() async {
    try {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        final capturedImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 1000,
          maxHeight: 1000,
          imageQuality: 90,
        );
        if (capturedImage != null) {
          image.value = File(capturedImage.path);
          selectedImage.value = true;
        }
      } else {
        Get.snackbar('Permission Denied', 'Camera permission required');
      }
    } catch (e) {
      Get.snackbar('Camera Error', 'Error capturing image: ${e.toString()}');
    }
  }
}