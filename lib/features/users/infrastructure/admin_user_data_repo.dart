import 'package:admin_fur_care/features/auth/profile/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminUserDataRepo {
  final FirebaseFirestore _firestore;

  AdminUserDataRepo(this._firestore);

  Future<List<UserModel>> getUsers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('users').get();
      List<UserModel> usersData = querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList();
      return usersData;
    } catch (e) {
      rethrow;
    }
  }
}
