import 'package:admin_fur_care/core/theme/responsive_size.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/presentation/admin_pet_detail_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdminAdaptionDetailScreen extends StatelessWidget {
  final AdminAdoptedPetsModels petsModel;
  const AdminAdaptionDetailScreen({super.key, required this.petsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: petsModel.petImageUrl ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .54,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.pets),
                    placeholder: (context, url) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Positioned(
                  top: ScreenUtils.getHeight(context, .04),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AdminPetDetailContainer(
              petsModel: petsModel,
            )
          ],
        ),
      ),
    );
  }
}
