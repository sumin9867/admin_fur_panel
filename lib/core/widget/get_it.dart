// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pet_care_app/admin/adaption/application/cubit/admin_adaption_cubit.dart';
// import 'package:pet_care_app/admin/adaption/infrastructure/admin_pet_repo.dart';
// import 'package:pet_care_app/admin/adaption_requets_screen.dart/application/cubit/admin_adoption_request_cubit.dart';
// import 'package:pet_care_app/admin/adaption_requets_screen.dart/infrastructure/admin_pet_repo.dart';
// import 'package:pet_care_app/admin/users/application/cubit/user_detail_cubit.dart';
// import 'package:pet_care_app/admin/users/infrastructure/admin_user_data_repo.dart';
// import 'package:pet_care_app/admin/vet/application/cubit/admin_vet_cubit.dart';
// import 'package:pet_care_app/admin/vet/infrastructure/admin_vet_repo.dart';
// import 'package:pet_care_app/core/auth/application/login_cubit/login_cubit.dart';
// import 'package:pet_care_app/core/auth/application/sign_up/auth_cubit.dart';
// import 'package:pet_care_app/core/auth/infrastructure/auth_repositary.dart';
// import 'package:pet_care_app/core/notification/application/notification_cubit.dart';
// import 'package:pet_care_app/core/notification/infrastructure/notification_repositary.dart';
// import 'package:pet_care_app/user/features/adaption/application/cubit/pet_cubit.dart';
// import 'package:pet_care_app/user/features/adaption/infrastructure/pet_repo.dart';
// import 'package:pet_care_app/user/features/incident/cubit/injury_cubit.dart';
// import 'package:pet_care_app/user/features/incident/infrastructure/injury_report_repo.dart';
// import 'package:pet_care_app/user/features/profile/application/cubit/profile_cubit_cubit.dart';
// import 'package:pet_care_app/user/features/profile/infrastructure/profile_repositary.dart';
// import 'package:pet_care_app/user/features/vet/application/cubit/vet_adaption_cubit.dart';
// import 'package:pet_care_app/user/features/vet/application/cubit/vet_cubit.dart';
// import 'package:pet_care_app/user/features/vet/infrastructure/vet_appoinment_repo.dart';
// import 'package:pet_care_app/user/features/vet/infrastructure/vet_repo.dart';

// final getIt = GetIt.instance;

// Future<void> setupLocators() async {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   //registering repositary
//   getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
//   getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
//   getIt.registerLazySingleton<AdminVetRepository>(
//       () => AdminVetRepository(firebaseFirestore, firebaseStorage));

//   getIt.registerLazySingleton<VetRepository>(() => VetRepository(
//         firebaseFirestore,
//       ));

//   getIt.registerLazySingleton<AdminPetsRepository>(
//       () => AdminPetsRepository(firebaseFirestore, firebaseStorage));

//   getIt.registerLazySingleton<AdminUserDataRepo>(() => AdminUserDataRepo(
//         firebaseFirestore,
//       ));

//   getIt.registerLazySingleton<PetsRepository>(() => PetsRepository(
//         firebaseFirestore,
//       ));
//   getIt.registerLazySingleton<InjuryReportRepository>(
//       () => InjuryReportRepository(firebaseFirestore, firebaseStorage));

//   getIt.registerLazySingleton<AdminAdoptionRequestRepository>(
//       () => AdminAdoptionRequestRepository(
//             firebaseFirestore,
//           ));

//   getIt.registerLazySingleton<NotificationRepositary>(
//       () => NotificationRepositary(firestore: firebaseFirestore));
//   getIt.registerLazySingleton<VetAppointmentReposiatry>(
//       () => VetAppointmentReposiatry(firestore: firebaseFirestore));

//   //resgistering cubit
//   getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
//   getIt.registerFactory(() =>
//       LoginCubit(getIt<AuthRepository>(), firebaseAuth, firebaseFirestore));
//   getIt.registerFactory(() =>
//       UsersCubit(adminUserDataRepo: getIt<AdminUserDataRepo>())..getUsers());
//   getIt.registerFactory(
//       () => ProfileCubit(getIt<ProfileRepo>())..fetchUserProfile());
//   getIt.registerFactory(
//       () => AdminVetCubit(getIt<AdminVetRepository>())..fetchVets());
//   getIt.registerFactory(
//       () => AdminPetCubit(getIt<AdminPetsRepository>())..fetchPetss());
//   getIt.registerFactory(() => VetCubit(getIt<VetRepository>()));
//   getIt.registerFactory(() => PetCubit(getIt<PetsRepository>())..fetchPets());
//   getIt.registerFactory(
//       () => InjuryCubit(getIt<InjuryReportRepository>())..fetchanimals());
//   getIt.registerFactory(() => AdminAdoptionRequestCubit(
//       adminPetsRepository: getIt<AdminAdoptionRequestRepository>())
//     ..fetchPets());
//   getIt.registerFactory(() => NotificationCubit(
//       notificationRepositary: getIt<NotificationRepositary>()));
//   getIt.registerFactory(() => VetAppoinmentCubit(
//       vetAppoinmentRepository: getIt<VetAppointmentReposiatry>()));
// }
