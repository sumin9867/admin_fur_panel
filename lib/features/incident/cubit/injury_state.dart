import 'package:admin_fur_care/features/incident/domain/injury_report_model.dart';

abstract class InjuryState {}

class InjuryInitial extends InjuryState {}

class InjuryLoading extends InjuryState {}

class InjuryAdded extends InjuryState {}

class InjurysLoaded extends InjuryState {
  final List<InjuryReportModel> injuryreport;

  InjurysLoaded({required this.injuryreport});
}

class InjuryError extends InjuryState {
  final String message;

  InjuryError(this.message);
}
