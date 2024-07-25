import 'package:admin_fur_care/admin_fur_app.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_cubit.dart';
import 'package:admin_fur_care/features/adaption/infrastructure/admin_pet_repo.dart';
import 'package:admin_fur_care/features/auth/application/login_cubit/login_cubit.dart';
import 'package:admin_fur_care/features/auth/application/sign_up/auth_cubit.dart';
import 'package:admin_fur_care/features/auth/infrastructure/auth_repositary.dart';
import 'package:admin_fur_care/features/auth/profile/application/cubit/profile_cubit_cubit.dart';
import 'package:admin_fur_care/features/auth/profile/infrastructure/profile_repositary.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/incident/infrastructure/injury_report_repo.dart';
import 'package:admin_fur_care/features/users/application/cubit/user_detail_cubit.dart';
import 'package:admin_fur_care/features/users/infrastructure/admin_user_data_repo.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/infrastructure/admin_vet_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBwEuLsoaWMRUTHJUUobkhBICnhh1YVdaU",
          appId: "1:1037600699455:web:b6b19b7134cc1bad07f48a",
          messagingSenderId: "1037600699455",
          projectId: "furcare-1d474"));
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final AuthRepository authRepository = AuthRepository();
  final ProfileRepo profileRepo = ProfileRepo();
  final AdminUserDataRepo adminUserDataRepo =
      AdminUserDataRepo(firebaseFirestore);
  final AdminVetRepository adminVetRepository = AdminVetRepository(
    firebaseFirestore,
  );
  final InjuryReportRepository injuryReportRepository =
      InjuryReportRepository(firebaseFirestore);
  final AdminPetsRepository adminPetsRepository =
      AdminPetsRepository(firebaseFirestore);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(authRepo: authRepository),
      ),
      BlocProvider(
        create: (context) =>
            LoginCubit(authRepository, firebaseAuth, firebaseFirestore),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(profileRepo),
      ),
      BlocProvider(
        create: (context) =>
            UsersCubit(adminUserDataRepo: adminUserDataRepo)..getUsers(),
      ),
      BlocProvider(
        create: (context) => AdminVetCubit(adminVetRepository)..fetchVets(),
      ),
      BlocProvider(
        create: (context) =>
            InjuryCubit(injuryReportRepository)..fetchanimals(),
      ),
      BlocProvider(
        create: (context) => AdminPetCubit(adminPetsRepository),
      ),
    ],
    child: const PetCareApp(),
  ));
}
