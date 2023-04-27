import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
  Connectivity get connectivity => Connectivity();
  ImagePicker get  imagePicker =>ImagePicker();
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
  FirebaseFirestore get firebaseFireStore => FirebaseFirestore.instance;
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}