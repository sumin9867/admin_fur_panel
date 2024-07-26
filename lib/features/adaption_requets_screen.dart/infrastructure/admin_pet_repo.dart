import 'package:admin_fur_care/features/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAdoptionRequestRepository {
  final FirebaseFirestore _firestore;

  AdminAdoptionRequestRepository(this._firestore);

  Future<List<AdminAdoptedPetsModels>> getpets() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('adopted_pets').get();

      if (querySnapshot.size == 0) {}

      return querySnapshot.docs
          .map((doc) => AdminAdoptedPetsModels.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> approvePetAdaption(adaptionId) async {
    try {
      await _firestore
          .collection('adopted_pets')
          .doc(adaptionId)
          .set({"petAdoptionStatus": "Approved"}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update pet adoption status.');
    }
  }

  Future<void> rejectedPetAdaption(adaptionId) async {
    try {
      await _firestore
          .collection('adopted_pets')
          .doc(adaptionId)
          .set({"petAdoptionStatus": "Rejected"}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update pet adoption status.');
    }
  }

  Future<void> deletePet(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('adopted_pets')
          .doc(docId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
