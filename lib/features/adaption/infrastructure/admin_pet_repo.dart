import 'dart:io';
import 'dart:typed_data';

import 'package:admin_fur_care/features/adaption/domain/admin_pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminPetsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  AdminPetsRepository(this._firestore, this._firebaseStorage);

  // Updated method to handle both File and Uint8List
  Future<String> uploadImage(dynamic image, String petsName) async {
    String fileName =
        'pets/${petsName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final Reference storageRef = _firebaseStorage.ref().child(fileName);
    UploadTask uploadTask;

    if (image is File) {
      uploadTask = storageRef.putFile(image);
    } else if (image is Uint8List) {
      uploadTask = storageRef.putData(image);
    } else {
      throw Exception('Invalid image type');
    }

    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> addpets(AdminPetsModel pets) async {
    await _firestore.collection('pets').add(pets.toMap());
  }

  Future<List<AdminPetsModel>> getpets() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('pets').get();
    return querySnapshot.docs
        .map((doc) => AdminPetsModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> deletePet(String docId) async {
    try {
      await _firestore.collection('pets').doc(docId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
