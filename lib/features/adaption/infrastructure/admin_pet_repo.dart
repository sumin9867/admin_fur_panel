import 'dart:io';

import 'package:admin_fur_care/features/adaption/domain/admin_pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminPetsRepository {
  final FirebaseFirestore _firestore;

  AdminPetsRepository(
    this._firestore,
  );

  // Future<String> uploadImage(File image, String petsName) async {
  //   String fileName =
  //       'pets/${petsName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
  //   final Reference storageRef = _storage.ref().child(fileName);
  //   final UploadTask uploadTask = storageRef.putFile(image);
  //   final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
  //   return await snapshot.ref.getDownloadURL();
  // }

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
      await FirebaseFirestore.instance.collection('pets').doc(docId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
