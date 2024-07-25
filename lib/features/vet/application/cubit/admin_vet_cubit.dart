// cubits/vet_cubit.dart
import 'dart:io';

import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_state.dart';
import 'package:admin_fur_care/features/vet/domain/admin_vet_model.dart';
import 'package:admin_fur_care/features/vet/infrastructure/admin_vet_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminVetCubit extends Cubit<AdminVetState> {
  final AdminVetRepository _adminvetRepository;

  AdminVetCubit(this._adminvetRepository) : super(AdminVetInitial());

  Future<void> addVet(AdminVetModel vet, File image) async {
    emit(AdminVetLoading());
    try {
      // String imageUrl = await _adminvetRepository.uploadImage(image, vet.name);
      // AdminVetModel updatedVet = vet.copyWith(imageUrl: imageUrl);
      await _adminvetRepository.addVet(vet);
      emit(AdminVetAdded());
    } catch (e) {
      emit(AdminVetError(e.toString()));
    }
  }

  Future<void> fetchVets() async {
    emit(AdminVetLoading());
    try {
      List<AdminVetModel> vets = await _adminvetRepository.getVets();
      print(vets);
      emit(AdminVetsLoaded(vets));
    } catch (e) {
      emit(AdminVetError(e.toString()));
    }
  }

  Future<void> deletepets(String id) async {
    emit(AdminVetLoading());
    try {
      await _adminvetRepository.deletevet(id);
    } catch (e) {
      emit(AdminVetError(e.toString()));
    }
  }
}
