import 'package:admin_fur_care/features/vet/domain/admin_vet_model.dart';

abstract class AdminVetState {}

class AdminVetInitial extends AdminVetState {}

class AdminVetLoading extends AdminVetState {}

class AdminVetAdded extends AdminVetState {}

class AdminVetsLoaded extends AdminVetState {
  final List<AdminVetModel> adminvets;

  AdminVetsLoaded(this.adminvets);
}

class AdminVetError extends AdminVetState {
  final String message;

  AdminVetError(this.message);
}
