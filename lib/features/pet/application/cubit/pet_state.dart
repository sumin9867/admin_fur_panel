import '../../domain/pet_model.dart';

abstract class PetState {}

class PetsInitial extends PetState {}

class PetsLoading extends PetState {}

class PetsAdded extends PetState {}

class PetsAdapted extends PetState {}

class PetsDeleted extends PetState {}

class PetsApproved extends PetState {}

class PetssLoaded extends PetState {
  final List<PetsModel> pets;

  PetssLoaded(this.pets);
}

class PetsError extends PetState {
  final String message;

  PetsError(this.message);
}
