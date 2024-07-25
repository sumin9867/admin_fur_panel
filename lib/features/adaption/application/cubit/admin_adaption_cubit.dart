import 'dart:io';

import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_state.dart';
import 'package:admin_fur_care/features/adaption/domain/admin_pet_model.dart';
import 'package:admin_fur_care/features/adaption/infrastructure/admin_pet_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPetCubit extends Cubit<AdminPetState> {
  final AdminPetsRepository _adminPetsRepository;

  AdminPetCubit(this._adminPetsRepository) : super(AdminPetsInitial());

  Future<void> addPets(AdminPetsModel pets, File image) async {
    emit(AdminPetsLoading());
    try {
      // String imageUrl =
      //     await _adminPetsRepository.uploadImage(image, pets.name);
      // AdminPetsModel updatedPets = pets.copyWith(imageUrl: imageUrl);
      await _adminPetsRepository.addpets(pets);
      emit(AdminPetsAdded());
    } catch (e) {
      emit(AdminPetsError(e.toString()));
    }
  }

  Future<void> fetchPetss() async {
    emit(AdminPetsLoading());
    try {
      List<AdminPetsModel> pets = await _adminPetsRepository.getpets();
      emit(AdminPetssLoaded(pets));
    } catch (e) {
      emit(AdminPetsError(e.toString()));
    }
  }

  Future<void> deletepets(String id) async {
    emit(AdminPetsLoading());
    try {
      await _adminPetsRepository.deletePet(id);
    } catch (e) {
      emit(AdminPetsError(e.toString()));
    }
  }
}
