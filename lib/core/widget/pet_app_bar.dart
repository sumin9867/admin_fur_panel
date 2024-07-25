// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pet_care_app/core/notification/application/notification_cubit.dart';
// import 'package:pet_care_app/core/notification/application/notification_state.dart';
// import 'package:pet_care_app/core/notification/presentation/notification_screen.dart';
// import 'package:pet_care_app/core/theme/app_color.dart';

// class PetAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const PetAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * .02),
//       child: AppBar(
//         elevation: 0,
//         backgroundColor: AppColor.container,
//         leading: Row(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Image.asset(
//                 "assets/menus.png",
//                 height: 30,
//                 width: 30,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(
//                     Icons.error,
//                     color: Colors.red,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const NotificationView()));
//           }, icon: BlocBuilder<NotificationCubit, NotificationState>(
//             builder: (context, state) {
//               if (state is NotificationInitial) {
//                 User? currentUser = FirebaseAuth.instance.currentUser;
//                 if (currentUser != null) {
//                   context
//                       .read<NotificationCubit>()
//                       .fetchNotification(currentUser.uid);
//                 }
//               } else if (state is NotificationLoaded) {
//                 if (state.notificationModel.isEmpty) {
//                   return const Icon(Icons.notifications_outlined);
//                 } else {
//                   return const Icon(
//                     Icons.notifications_active_rounded,
//                     color: AppColor.danger,
//                   );
//                 }
//               }
//               return const SizedBox();
//             },
//           )),
//           // CircleAvatar(
//           //   child: BlocBuilder<ProfileCubit, ProfileState>(
//           //     builder: (context, state) {
//           //       if (state is ProfileLoading) {
//           //         context.read<ProfileCubit>().fetchUserProfile();
//           //         return const CircularProgressIndicator();
//           //       } else if (state is ProfileLoaded) {
//           //         return CircleAvatar(
//           //           radius: 50,
//           //           backgroundImage: state.userModel.profileImageUrl != null &&
//           //                   state.userModel.profileImageUrl!.isNotEmpty
//           //               ? NetworkImage(state.userModel.profileImageUrl!)
//           //               : null,
//           //           child: state.userModel.profileImageUrl == null ||
//           //                   state.userModel.profileImageUrl!.isEmpty
//           //               ? const Icon(
//           //                   Icons.person,
//           //                 )
//           //               : null,
//           //         );
//           //       } else {
//           //         return const Icon(Icons.person);
//           //       }
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
