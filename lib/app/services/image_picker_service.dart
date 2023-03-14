import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<String?> uploadImageToFirebaseStorage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image;

    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      final firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
      final firebase_storage.UploadTask uploadTask =
          storageRef.putFile(File(image!.path));
      final firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
