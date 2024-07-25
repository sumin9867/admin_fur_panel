import 'package:admin_fur_care/core/widget/delete_button_widget.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/domain/admin_vet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminVetCard extends StatelessWidget {
  final AdminVetModel vet;

  const AdminVetCard({super.key, required this.vet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!),
                image: vet.imageUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(vet.imageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: vet.imageUrl.isEmpty
                  ? const Icon(Icons.person, size: 50, color: Colors.grey)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vet.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Education: ${vet.education}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Experience: ${vet.experience}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Working Days: ${vet.workingDays}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Available Time: ${vet.availableTime}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DeleteButtonWidget(onPressed: () {
                    context.read<AdminVetCubit>().deletepets(vet.id);
                    context.read<AdminVetCubit>().fetchVets();
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
