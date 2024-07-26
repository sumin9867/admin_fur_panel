import 'package:admin_fur_care/features/adaption_requets_screen.dart/domain/admin_adapted_pets_model.dart';

abstract class AdminAdaptionRequestate {}

class AdminAdaptionRequestInitial extends AdminAdaptionRequestate {}

class AdminAdaptionRequestLoading extends AdminAdaptionRequestate {}

class AdminAdaptionRequestApproved extends AdminAdaptionRequestate {}

class AdminAdaptionRequestLoaded extends AdminAdaptionRequestate {
  final List<AdminAdoptedPetsModels> adminAdaptionRequest;

  AdminAdaptionRequestLoaded(this.adminAdaptionRequest);
}

class AdminAdaptionRequestError extends AdminAdaptionRequestate {
  final String message;

  AdminAdaptionRequestError(this.message);
}
