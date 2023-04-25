import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/data/di/service_locator.dart';

@LazySingleton()
class StorageService {
  final FirebaseStorage firebaseStorage;

  StorageService(this.firebaseStorage);

  Future<String> uploadProfilePic(String path, File file) async {
    final Reference storageRef = firebaseStorage.ref().child(path);
    await storageRef.putFile(file);
    String downloadedURL = await storageRef.getDownloadURL();
    return downloadedURL;
  }

  Future<void> deleteProfileImage(String path) async {
    final Reference storageRef = getIt.get<FirebaseStorage>().ref().child(path);
    await storageRef.delete();
  }
}
