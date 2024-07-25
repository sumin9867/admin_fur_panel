// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pet_care_app/admin/adaption/presentation/admin_pet_list_screen.dart';
// import 'package:pet_care_app/admin/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';
// import 'package:pet_care_app/admin/adaption_requets_screen.dart/presentation/admin_adaption_request_detail.dart';
// import 'package:pet_care_app/admin/adaption_requets_screen.dart/presentation/admin_adaption_request_list_screen.dart';
// import 'package:pet_care_app/admin/incident/presentation/admin_incident_detail_screen.dart';
// import 'package:pet_care_app/admin/incident/presentation/admin_incident_screen.dart';
// import 'package:pet_care_app/admin/users/presentation/user_detail_screen.dart';
// import 'package:pet_care_app/admin/vet/presentation/add_vet_screen.dart';
// import 'package:pet_care_app/admin/vet/presentation/admin_vet_list_screen.dart';
// import 'package:pet_care_app/core/auth/application/sign_up/auth_cubit.dart';
// import 'package:pet_care_app/core/auth/application/sign_up/auth_state.dart';
// import 'package:pet_care_app/core/auth/presentation/login/sign_in_form.dart';
// import 'package:pet_care_app/core/auth/presentation/sign_up/sign_up_form.dart';
// import 'package:pet_care_app/core/widget/scaffold_with_bottom_nav_bar.dart';
// import 'package:pet_care_app/user/features/adaption/domain/pet_model.dart';
// import 'package:pet_care_app/user/features/adaption/presentation/adaptation_screen.dart';
// import 'package:pet_care_app/user/features/adaption/presentation/adoption_detail_screen.dart';
// import 'package:pet_care_app/user/features/first_screen.dart';
// import 'package:pet_care_app/user/features/incident/domain/injury_report_model.dart';
// import 'package:pet_care_app/user/features/incident/presentation/add_incident_screen.dart';
// import 'package:pet_care_app/user/features/incident/presentation/incident_screen.dart';
// import 'package:pet_care_app/user/features/incident/presentation/incodent_detail.dart';
// import 'package:pet_care_app/user/features/profile/domain/user_model.dart';
// import 'package:pet_care_app/user/features/profile/presentation/edit_profile.dart';
// import 'package:pet_care_app/user/features/profile/presentation/profile_screen.dart';
// import 'package:pet_care_app/user/features/profile/presentation/view_profile.dart';
// import 'package:pet_care_app/user/features/vet/domain/vet_model.dart';
// import 'package:pet_care_app/user/features/vet/presentation/detail_page/vet_appointment_screen.dart';
// import 'package:pet_care_app/user/features/vet/presentation/vet_screen.dart';

// class AppRoutes {
//   //users
//   static const String splash = '/';
//   static const String login = '/login';
//   static const String signup = '/signup';
//   static const String vetScreen = '/vetscreen';
//   static const String vetDetailScreen = '/vetdetailscreen';
//   static const String pet = '/pet';
//   static const String petdetail = '/petdetail';
//   static const String incident = '/incident';
//   static const String incidentdetail = '/incidentdetail';
//   static const String addincident = '/addincident';

//   //admin
//   static const String adminusers = '/adminusers';
//   static const String adminadaptionlist = '/adminadaptionlist';
//   static const String adminaddadaption = '/adminaddadaption';
//   static const String adminadaptionrequestlist = '/adminadaptionrequestlist';
//   static const String adminadaptionrequestdetail =
//       '/adminadaptionrequestdetail';
//   static const String adminincidentlist = '/adminincidentlist';
//   static const String adminincidentdetail = '/adminincidentdetail';
//   static const String adminvetlist = '/adminvetlist';
//   static const String adminaddvet = '/adminaddvet';

// // both
//   static const String profile = '/profile';
//   static const String viewprofile = '/viewprofile';
//   static const String editprofile = '/editprofile';
//   static const String vetdetailscreen = '/vetdetailscreen';
//   static const String logout = '/logout';
// }

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();

// class AppRouter {
//   GoRouter get router => _router;

//   final GoRouter _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: AppRoutes.splash,
//         builder: (context, state) => const FirstScreen(),
//       ),
//       GoRoute(
//         path: AppRoutes.signup,
//         builder: (context, state) => const SignUpForm(),
//       ),
//       GoRoute(
//         path: AppRoutes.login,
//         builder: (context, state) => const SignInForm(),
//       ),
//       GoRoute(
//         path: AppRoutes.vetScreen,
//         builder: (context, state) => const VetScreen(),
//       ),
//       GoRoute(
//         path: AppRoutes.vetdetailscreen,
//         builder: (context, state) {
//           final vetModel = state.extra as VetModel;
//           return VetAppointmentScreen(
//             vetModel: vetModel,
//           );
//         },
//       ),
//       GoRoute(
//         path: AppRoutes.pet,
//         builder: (context, state) => const AdaptionScreen(),
//       ),
//       GoRoute(
//         path: AppRoutes.petdetail,
//         builder: (context, state) {
//           final petModel = state.extra as PetsModel;
//           return AdaptionDetailScreen(
//             petsModel: petModel,
//           );
//         },
//       ),
//       GoRoute(
//         path: AppRoutes.incident,
//         builder: (context, state) => const IncidentScreen(),
//       ),
//       GoRoute(
//           path: AppRoutes.incidentdetail,
//           builder: (context, state) {
//             final incidentModel = state.extra as InjuryReportModel;
//             return IncidentDetailScreen(injuryReport: incidentModel);
//           }),
//       GoRoute(
//         path: AppRoutes.addincident,
//         builder: (context, state) => const AddIncidentScreen(),
//       ),

//       // admin
//       GoRoute(
//         path: AppRoutes.adminusers,
//         builder: (context, state) => const AdminUserDetail(),
//       ),
//       GoRoute(
//         path: AppRoutes.adminadaptionlist,
//         builder: (context, state) {
//           return const AdminPetAdaptionList();
//         },
//       ),
//       GoRoute(
//         path: AppRoutes.adminadaptionrequestlist,
//         builder: (context, state) => const AdminPetAdaptionRequestList(),
//       ),
//       GoRoute(
//           path: AppRoutes.adminadaptionrequestdetail,
//           builder: (context, state) {
//             final adminpetsModel = state.extra as AdminAdoptedPetsModels;
//             return AdminAdaptionDetailScreen(petsModel: adminpetsModel);
//           }),
//       GoRoute(
//         path: AppRoutes.adminincidentlist,
//         builder: (context, state) => const AdminIncidentScreen(),
//       ),
//       GoRoute(
//           path: AppRoutes.adminincidentdetail,
//           builder: (context, state) {
//             final injuryreportModel = state.extra as InjuryReportModel;

//             return AdminIncidentDetailScreen(injuryReport: injuryreportModel);
//           }),
//       GoRoute(
//         path: AppRoutes.adminvetlist,
//         builder: (context, state) => const AdminVetListScreen(),
//       ),
//       GoRoute(
//         path: AppRoutes.adminaddvet,
//         builder: (context, state) => const AddVetScreen(),
//       ),
//       //profile

//       GoRoute(
//         path: AppRoutes.profile,
//         builder: (context, state) => const ProfileScreen(),
//       ),
//       GoRoute(
//           path: AppRoutes.viewprofile,
//           builder: (context, state) {
//             final userModel = state.extra as UserModel;

//             return ViewProfile(userModel: userModel);
//           }),
//       GoRoute(
//           path: AppRoutes.editprofile,
//           builder: (context, state) {
//             return const EditProfile();
//           }),
//       GoRoute(
//         path: AppRoutes.logout,
//         builder: (context, state) => const SignInForm(),
//       ),
//       ShellRoute(
//         navigatorKey: _shellNavigatorKey,
//         builder: (_, state, child) {
//           return ScaffoldWithBottomNavBar(body: child);
//         },
//         routes: [
//           GoRoute(
//             path: AppRoutes.vetScreen,
//             builder: (context, state) => const VetScreen(),
//           ),
//           GoRoute(
//             path: AppRoutes.pet,
//             builder: (context, state) => const AdaptionScreen(),
//           ),
//           GoRoute(
//             path: AppRoutes.incident,
//             builder: (context, state) => const IncidentScreen(),
//           ),
//           GoRoute(
//             path: AppRoutes.profile,
//             builder: (context, state) => const ProfileScreen(),
//           ),
//         ],
//       ),
//     ],
//   );
// }
