import 'package:admin_fur_care/core/admin_bottom_navigation_bar.dart';
import 'package:admin_fur_care/core/theme/app_theme.dart';
import 'package:admin_fur_care/core/widget/unfocus.dart';
import 'package:admin_fur_care/features/adaption/presentation/admin_pet_list_screen.dart';
import 'package:admin_fur_care/features/auth/presentation/login/sign_in_form.dart';
import 'package:admin_fur_care/features/incident/presentation/admin_incident_screen.dart';
import 'package:admin_fur_care/features/dash_board/dash_board.screen.dart';
import 'package:admin_fur_care/features/vet/presentation/add_vet_screen.dart';
import 'package:admin_fur_care/features/vet/presentation/admin_vet_list_screen.dart';
import 'package:flutter/material.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UnFocus(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      home: SignInForm(),
    ));
  }
}
