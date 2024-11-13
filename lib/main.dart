import 'package:admin_fur_care/admin_fur_app.dart';
import 'package:admin_fur_care/core/get_it.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_cubit.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_cubit.dart';
import 'package:admin_fur_care/features/auth/application/login_cubit/login_cubit.dart';
import 'package:admin_fur_care/features/auth/application/sign_up/auth_cubit.dart';
import 'package:admin_fur_care/features/auth/profile/application/cubit/profile_cubit_cubit.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/notification/application/notification_cubit.dart';
import 'package:admin_fur_care/features/users/application/cubit/user_detail_cubit.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  await setupLocators();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<AuthCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<UsersCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
      ),
      BlocProvider(create: (context) => getIt<AdminVetCubit>()),
      BlocProvider(
        create: (context) => getIt<AdminPetCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<InjuryCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<AdminAdoptionRequestCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<NotificationCubit>(),
      ),
    ],
    child: const PetCareApp(),
  ));
}
