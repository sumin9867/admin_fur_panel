import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/adapted_pets_model.dart';
import '../../domain/pet_model.dart';
import '../../infrastructure/pet_repo.dart';
import 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  final PetsRepository _petsRepository;

  PetCubit(this._petsRepository) : super(PetsInitial());

  Future<void> fetchPets() async {
    emit(PetsLoading());
    try {
      List<PetsModel> pets = await _petsRepository.getpets();
      emit(PetssLoaded(pets));
    } catch (e) {
      emit(PetsError(e.toString()));
    }
  }

  Future<void> addAdoptedPets(AdoptedPetsModels adoptedPetsModels) async {
    emit(PetsLoading());
    try {
      await _petsRepository.addAdaopted(adoptedPetsModels);
      emit(PetsAdapted());
    } catch (e) {
      emit(PetsError(e.toString()));
    }
  }

  Future<void> approvePetAdoption(petId) async {
    emit(PetsLoading());
    try {
      await _petsRepository.approvePetAdaption(petId);
      emit(PetsApproved());
    } catch (e) {
      emit(PetsError(e.toString()));
    }
  }

  Future<void> rejectedPetAdoption(petId) async {
    emit(PetsLoading());
    try {
      await _petsRepository.rejectPetAdaption(petId);
      emit(PetsApproved());
    } catch (e) {
      emit(PetsError(e.toString()));
    }
  }
}
