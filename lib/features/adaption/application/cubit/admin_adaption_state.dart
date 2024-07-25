import 'package:admin_fur_care/features/adaption/domain/admin_pet_model.dart';

abstract class AdminPetState {}

class AdminPetsInitial extends AdminPetState {}

class AdminPetsLoading extends AdminPetState {}

class AdminPetsAdded extends AdminPetState {}

class AdminPetsDeleted extends AdminPetState {}

class AdminPetssLoaded extends AdminPetState {
  final List<AdminPetsModel> adminPetss;

  AdminPetssLoaded(this.adminPetss);
}

class AdminPetsError extends AdminPetState {
  final String message;

  AdminPetsError(this.message);
}
