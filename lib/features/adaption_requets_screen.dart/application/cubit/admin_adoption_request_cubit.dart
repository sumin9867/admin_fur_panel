import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_state.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/infrastructure/admin_pet_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAdoptionRequestCubit extends Cubit<AdminAdaptionRequestate> {
  final AdminAdoptionRequestRepository adminPetsRepository;

  AdminAdoptionRequestCubit({required this.adminPetsRepository})
      : super(AdminAdaptionRequestInitial());

  Future<void> fetchPets() async {
    emit(AdminAdaptionRequestLoading());
    try {
      List<AdminAdoptedPetsModels> pets = await adminPetsRepository.getpets();

      emit(AdminAdaptionRequestLoaded(pets));
    } catch (e) {
      emit(AdminAdaptionRequestError(e.toString()));
    }
  }

  Future<void> approvedpet(adaptionid) async {
    emit(AdminAdaptionRequestLoading());
    try {
      await adminPetsRepository.approvePetAdaption(adaptionid);

      emit(AdminAdaptionRequestApproved());
    } catch (e) {
      emit(AdminAdaptionRequestError(e.toString()));
    }
  }

  Future<void> rejectpet(adaptionid) async {
    emit(AdminAdaptionRequestLoading());
    try {
      await adminPetsRepository.rejectedPetAdaption(adaptionid);

      emit(AdminAdaptionRequestApproved());
    } catch (e) {
      emit(AdminAdaptionRequestError(e.toString()));
    }
  }

  Future<void> deletepets(String id) async {
    emit(AdminAdaptionRequestLoading());
    try {
      await adminPetsRepository.deletePet(id);
    } catch (e) {
      emit(AdminAdaptionRequestError(e.toString()));
    }
  }
}
