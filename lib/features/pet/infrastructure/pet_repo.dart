import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/adapted_pets_model.dart';
import '../domain/pet_model.dart';

class PetsRepository {
  final FirebaseFirestore _firestore;

  PetsRepository(
    this._firestore,
  );

  Future<List<PetsModel>> getpets() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('pets').get();
    return querySnapshot.docs
        .map((doc) => PetsModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> approvePetAdaption(petID) async {
    try {
      await _firestore
          .collection('pets')
          .doc(petID)
          .set({"adoptionStatus": "Approved"}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update pet adoption status.');
    }
  }

  Future<void> rejectPetAdaption(petID) async {
    try {
      await _firestore
          .collection('pets')
          .doc(petID)
          .set({"adoptionStatus": "Rejected"}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update pet adoption status.');
    }
  }

  Future<void> addAdaopted(AdoptedPetsModels adaptedPetsModel) async {
    await _firestore.collection('adopted_pets').add(adaptedPetsModel.toMap());
  }
}
