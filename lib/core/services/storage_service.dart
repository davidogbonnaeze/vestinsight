import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart';

class StorageService {
  Future<String> uploadUserProfileImage(String url, File imageFile) async {
    String photoId = Uuid().v4();
    File image = await compressImage(imageFile, photoId);
    if (url.isNotEmpty) {
      RegExp regExp = RegExp(r'userProfile_(.*).jpg');
      photoId = regExp.firstMatch(url)[1];
    }

    StorageUploadTask uploadTask = storageRef
        .child('images/users/userProfile_$photoId.jpg')
        .putFile(image);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadProofOfInvestmentImage(File imageFile) async {
    String photoId = Uuid().v4();
    File image = await compressImage(imageFile, photoId);
    StorageUploadTask uploadTask = storageRef
        .child('images/proofOfInvestment/proofOfInvestment_$photoId.jpg')
        .putFile(image);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<File> compressImage(File image, String photoId) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    File compressedImage = await FlutterImageCompress.compressAndGetFile(
        image.absolute.path, '$path/img_$photoId.jpg',
        quality: 70);
    return compressedImage;
  }
}
