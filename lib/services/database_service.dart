import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class Database {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore database = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
}
