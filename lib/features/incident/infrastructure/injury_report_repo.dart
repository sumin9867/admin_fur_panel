import 'package:admin_fur_care/features/incident/domain/injury_report_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InjuryReportRepository {
  final FirebaseFirestore _firestore;

  InjuryReportRepository(
    this._firestore,
  );

  Future<List<InjuryReportModel>> getInjury() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('incident').get();
    return querySnapshot.docs
        .map((doc) => InjuryReportModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> deleteInjuryReport(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('incident')
          .doc(documentId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
