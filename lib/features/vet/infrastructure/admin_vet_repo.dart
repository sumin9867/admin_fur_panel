// repositories/vet_repository.dart
import 'dart:io';

import 'package:admin_fur_care/features/vet/domain/admin_vet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminVetRepository {
  final FirebaseFirestore _firestore;
  // final FirebaseStorage _storage;

  AdminVetRepository(
    this._firestore,
  );

  // Future<String> uploadImage(File image, String vetName) async {
  //   String fileName =
  //       'vets/${vetName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
  //   final Reference storageRef = _storage.ref().child(fileName);
  //   final UploadTask uploadTask = storageRef.putFile(image);
  //   final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
  //   return await snapshot.ref.getDownloadURL();
  // }

  Future<void> addVet(AdminVetModel vet) async {
    await _firestore.collection('vets').add(vet.toMap());
  }

  Future<List<AdminVetModel>> getVets() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('vets').get();
    return querySnapshot.docs
        .map((doc) => AdminVetModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> deletevet(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('vets').doc(docId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
