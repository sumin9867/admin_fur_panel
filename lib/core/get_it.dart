import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_cubit.dart';
import 'package:admin_fur_care/features/adaption/infrastructure/admin_pet_repo.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_cubit.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/infrastructure/admin_pet_repo.dart';
import 'package:admin_fur_care/features/auth/application/login_cubit/login_cubit.dart';
import 'package:admin_fur_care/features/auth/application/sign_up/auth_cubit.dart';
import 'package:admin_fur_care/features/auth/profile/application/cubit/profile_cubit_cubit.dart';
import 'package:admin_fur_care/features/auth/profile/infrastructure/profile_repositary.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/incident/infrastructure/injury_report_repo.dart';
import 'package:admin_fur_care/features/notification/infrastructure/notification_repositary.dart';
import 'package:admin_fur_care/features/pet/application/cubit/pet_cubit.dart';
import 'package:admin_fur_care/features/pet/infrastructure/pet_repo.dart';
import 'package:admin_fur_care/features/users/application/cubit/user_detail_cubit.dart';
import 'package:admin_fur_care/features/users/infrastructure/admin_user_data_repo.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/infrastructure/admin_vet_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/infrastructure/auth_repositary.dart';
import '../features/notification/application/notification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocators() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //registering repositary
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
  getIt.registerLazySingleton<AdminVetRepository>(() => AdminVetRepository(
        firebaseFirestore,
      ));

  getIt.registerLazySingleton<AdminPetsRepository>(
      () => AdminPetsRepository(firebaseFirestore, firebaseStorage));

  getIt.registerLazySingleton<AdminUserDataRepo>(() => AdminUserDataRepo(
        firebaseFirestore,
      ));

  getIt.registerLazySingleton<PetsRepository>(() => PetsRepository(
        firebaseFirestore,
      ));
  getIt.registerLazySingleton<InjuryReportRepository>(
      () => InjuryReportRepository(
            firebaseFirestore,
          ));

  getIt.registerLazySingleton<AdminAdoptionRequestRepository>(
      () => AdminAdoptionRequestRepository(
            firebaseFirestore,
          ));

  getIt.registerLazySingleton<NotificationRepositary>(
      () => NotificationRepositary(firestore: firebaseFirestore));

  //resgistering cubit
  getIt.registerFactory(() => AuthCubit(
        authRepo: getIt<AuthRepository>(),
      ));
  getIt.registerFactory(() =>
      LoginCubit(getIt<AuthRepository>(), firebaseAuth, firebaseFirestore));
  getIt.registerFactory(() =>
      UsersCubit(adminUserDataRepo: getIt<AdminUserDataRepo>())..getUsers());
  getIt.registerFactory(
      () => ProfileCubit(getIt<ProfileRepo>())..fetchUserProfile());
  getIt.registerFactory(
      () => AdminVetCubit(getIt<AdminVetRepository>())..fetchVets());
  getIt.registerFactory(
      () => AdminPetCubit(getIt<AdminPetsRepository>())..fetchPetss());
  getIt.registerFactory(() => PetCubit(getIt<PetsRepository>())..fetchPets());
  getIt.registerFactory(
      () => InjuryCubit(getIt<InjuryReportRepository>())..fetchanimals());
  getIt.registerFactory(() => AdminAdoptionRequestCubit(
      adminPetsRepository: getIt<AdminAdoptionRequestRepository>())
    ..fetchPets());
  getIt.registerFactory(() => NotificationCubit(
      notificationRepositary: getIt<NotificationRepositary>()));
}
