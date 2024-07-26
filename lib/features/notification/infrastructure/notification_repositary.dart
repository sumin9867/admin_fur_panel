import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/notification_model.dart';

class NotificationRepositary {
  final FirebaseFirestore firestore;

  NotificationRepositary({required this.firestore});

  Future<void> addNotification(NotificationModel notification) async {
    try {
      await firestore.collection('notifications').add(notification.toJson());
    } catch (e) {
      throw Exception("Error adding notification: $e");
    }
  }

  Future<List<NotificationModel>> fetchNotifications(String userId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .get();

      List<NotificationModel> notifications = querySnapshot.docs.map((doc) {
        return NotificationModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return notifications;
    } catch (e) {
      throw Exception("Error fetching notifications: $e");
    }
  }

  Future<void> deleteNotification(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc(docId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
