import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

 final box = GetStorage();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final profileImage = Rxn<File>();

  @override
  void onInit() {
    super.onInit();


    usernameController.text = box.read('username') ?? '';
    passwordController.text = box.read('password') ?? '';

  
    final imagePath = box.read('profileImage');
    if (imagePath != null && File(imagePath).existsSync()) {
      profileImage.value = File(imagePath);
    }
  }

  void saveProfile() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username and password can't be empty");
      return;
    }

    box.write('username', username);
    box.write('password', password);

    if (profileImage.value != null) {
      box.write('profileImage', profileImage.value!.path);
    }

    Get.snackbar("Saved", "Profile updated successfully!");
  }

  void pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      profileImage.value = File(picked.path);
    }
  }

  @override
void onClose() {
  usernameController.dispose();
  passwordController.dispose();
  super.onClose();
}
}




