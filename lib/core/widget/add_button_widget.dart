import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const AddButtonWidget(
      {required this.onPressed, super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminVetCubit, AdminVetState>(
      builder: (context, state) {
        return ElevatedButton.icon(
          onPressed: state is AdminVetLoading ? null : onPressed,
          icon: state is AdminVetLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const Icon(
                  Icons.add,
                  size: 24.0,
                  color: AppColor.button,
                ),
          label: state is AdminVetLoading
              ? const Text(
                  'Adding...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            textStyle: const TextStyle(fontSize: 16.0),
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}
