// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';

// // class PushNotificationService {
// //   static final PushNotificationService _instance =
// //       PushNotificationService._internal();

// //   factory PushNotificationService() {
// //     return _instance;
// //   }

// //   PushNotificationService._internal();

// //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
// //   String? _token;

// //   Future<void> init() async {
// //     await requestPermission();
// //     await getToken();
// //   }

// //   Future<void> requestPermission() async {
// //     NotificationSettings settings = await _firebaseMessaging.requestPermission(
// //       alert: true,
// //       announcement: false,
// //       badge: true,
// //       carPlay: false,
// //       criticalAlert: false,
// //       provisional: false,
// //       sound: true,
// //     );

// //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// //       print('User granted permission');
// //     } else if (settings.authorizationStatus ==
// //         AuthorizationStatus.provisional) {
// //       print('User granted provisional permission');
// //     } else {
// //       print('Permission denied');
// //     }
// //   }

// //   Future<void> getToken() async {
// //     _token = await _firebaseMessaging.getToken();
// //     print("My token is $_token");
// //     await saveToken(_token ?? "");
// //   }

// //   Future<void> saveToken(String token) async {
// //     User? currentUser = FirebaseAuth.instance.currentUser;

// //     if (currentUser != null) {
// //       await FirebaseFirestore.instance
// //           .collection("users")
// //           .doc(currentUser.uid)
// //           .set({'token': token}, SetOptions(merge: true));
// //     }
// //   }
// //   // Future<void>  sendPushNotification(String token, String body, String title)async {

// //   //   try {
// //   //     await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),headers:<String String>{'Content-Type':'application/json','Authorization':'key='})

// //   //   } catch (e) {

// //   //   }

// //   // Future<void> initPushNotification() async {
// //   //   await _firebaseMessaging.setForegroundNotificationPresentationOptions(
// //   //     alert: true,
// //   //     badge: true,
// //   //     sound: true,
// //   //   );
// //   //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
// //   //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
// //   //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
// //   // }

// //   // void handleMessage(RemoteMessage? message) {
// //   //   if (message == null) return;
// //   //   // Handle the notification, e.g., navigate to a specific screen
// //   //   // navigatorKey.currentState?.pushNamed(NotificationView.route, arguments: message);
// //   // }

// //   // static Future<void> handleBackgroundMessage(RemoteMessage message) async {
// //   //   print(message.notification?.title);
// //   //   print(message.notification?.body);
// //   //   print(message.data);
// //   // }
// // }
// import 'package:dart_firebase_admin/dart_firebase_admin.dart';
// import 'dart:io';

// class FirebaseAdminService {
//   static FirebaseAdminApp? _adminApp;

//   // Private constructor
//   FirebaseAdminService._();

//   // Method to initialize the FirebaseAdminApp
//   static Future<void> initialize() async {
//     if (_adminApp == null) {
//       _adminApp = FirebaseAdminApp.initializeApp(
//         'furcare-1d474', // Replace with your Firebase project ID
//         Credential.fromServiceAccount(
//           File('assets/service.json'),
//         ),
//       );
//     }
//   }

//   // Method to get the initialized FirebaseAdminApp
//   static FirebaseAdminApp get instance {
//     if (_adminApp == null) {
//       throw Exception(
//           "FirebaseAdminApp is not initialized. Call initialize() first.");
//     }
//     return _adminApp!;
//   }
// }
