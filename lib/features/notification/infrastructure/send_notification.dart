// import 'package:dart_firebase_admin/dart_firebase_admin.dart';
// import 'package:dart_firebase_admin/messaging.dart';
// import 'package:pet_care_app/core/notification/infrastructure/notiication_api.dart';

// Future<void> sendNotification(String token) async {
//   final FirebaseAdminApp adminApp = FirebaseAdminService.instance;
//   final Messaging messaging = Messaging(adminApp);

//   // Create a Notification instance
//   await messaging.send(
//     TokenMessage(
//       token: token,
//       notification: Notification(
//         // The content of the notification
//         title: 'Hello',
//         body: 'World',
//       ),
//     ),
//   );
// }
