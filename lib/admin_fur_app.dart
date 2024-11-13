import 'package:admin_fur_care/core/theme/app_theme.dart';
import 'package:admin_fur_care/core/widget/unfocus.dart';
import 'package:admin_fur_care/features/auth/presentation/login/sign_in_form.dart';
import 'package:flutter/material.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UnFocus(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      home: const SignInForm(),
    ));
  }
}
