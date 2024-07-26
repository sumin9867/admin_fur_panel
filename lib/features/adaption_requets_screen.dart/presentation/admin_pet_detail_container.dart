import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/core/utils.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_cubit.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/presentation/pet_attributes.dart';
import 'package:admin_fur_care/features/pet/application/cubit/pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../notification/application/notification_cubit.dart';
import '../../notification/domain/notification_model.dart';

class AdminPetDetailContainer extends StatefulWidget {
  final AdminAdoptedPetsModels petsModel;
  const AdminPetDetailContainer({super.key, required this.petsModel});

  @override
  State<AdminPetDetailContainer> createState() =>
      _AdminPetDetailContainerState();
}

class _AdminPetDetailContainerState extends State<AdminPetDetailContainer> {
  bool isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.petsModel.petName ?? "",
            style: const TextStyle(
              fontSize: 24,
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                widget.petsModel.petLocation ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PetAttribute(
                icon: Icons.male,
                label: widget.petsModel.petGender ?? "",
                attribute: 'Sex',
              ),
              const PetAttribute(
                icon: Icons.color_lens,
                label: 'Black',
                attribute: 'Color',
              ),
              PetAttribute(
                icon: Icons.pets,
                label: widget.petsModel.petBreed ?? "",
                attribute: 'Breed',
              ),
              const PetAttribute(
                icon: Icons.monitor_weight,
                label: '2kg',
                attribute: 'Weight',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // const CircleAvatar(
              //   backgroundImage: AssetImage('assets/avatar.'),
              // ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Requested By:'),
                  Text(
                    widget.petsModel.userName ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  try {
                    await Utils.sendEmail(
                      email: widget.petsModel.userEmail ?? "",
                      subject: 'Feedback on Pet Adoption Request',
                      body: '''
Dear ${widget.petsModel.userName},

We are pleased to inform you that you have been selected for the adoption of ${widget.petsModel.petName}. Your application has been carefully reviewed, and we believe you will provide a loving and caring home for ${widget.petsModel.petName}.

Please let us know if you have any further questions or if there are any additional steps we need to take to complete the adoption process.

Thank you for your interest in adopting from us. We look forward to finalizing the adoption and welcoming ${widget.petsModel.petName} into your home.

Best regards,
Fur Care
''',
                    );
                  } catch (e) {
                    Text(e.toString());
                  }
                },
                child: const Icon(Icons.phone),
              ),
              const Gap(20),
              GestureDetector(child: const Icon(Icons.email)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    final petModel = widget.petsModel;

                    context
                        .read<AdminAdoptionRequestCubit>()
                        .approvedpet(petModel.adaptionid);
                    context.read<PetCubit>().approvePetAdoption(petModel.petId);

                    NotificationModel notificationModel = NotificationModel(
                        date: DateTime.now(),
                        userId: widget.petsModel.userId ?? "",
                        title: "Adoption Approval",
                        message:
                            "You are approved to adopt ${widget.petsModel.petName}.We believe in you 😄",
                        id: "");

                    context
                        .read<NotificationCubit>()
                        .sendNotification(notificationModel: notificationModel);
                    // sendNotification(
                    //     "cg0KP38jSSS4CdrTB7uaDd:APA91bEEGd6iTKtz4d3pyc0Pfs22ea7RsZoc7l3ZFfIHdEXnABtONum2h-7LojINRVG4gefAxbGSpUSCMvj_PIPgq8oVHrfzfleDm7zin4M_PJFEVe5hOmKqkbjq6kpxXwtJGGncFdLO");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                  ),
                  child: const Text(
                    'Approved',
                    style: TextStyle(color: AppColor.button),
                  ),
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    final petModel = widget.petsModel;
                    context
                        .read<AdminAdoptionRequestCubit>()
                        .rejectpet(petModel.adaptionid);
                    context
                        .read<PetCubit>()
                        .rejectedPetAdoption(petModel.petId);
                    NotificationModel notificationModel = NotificationModel(
                        date: DateTime.now(),
                        userId: widget.petsModel.userId ?? "",
                        title: "Adoption Rejected",
                        message:
                            "Unfortunately, your request to adopt ${widget.petsModel.petName} has been declined.",
                        id: "");
                    context
                        .read<NotificationCubit>()
                        .sendNotification(notificationModel: notificationModel);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.danger,
                  ),
                  child: const Text(
                    'Rejected',
                    style: TextStyle(color: AppColor.button),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
