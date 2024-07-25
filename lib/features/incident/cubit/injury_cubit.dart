import 'dart:io';

import 'package:admin_fur_care/features/incident/cubit/injury_state.dart';
import 'package:admin_fur_care/features/incident/domain/injury_report_model.dart';
import 'package:admin_fur_care/features/incident/infrastructure/injury_report_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InjuryCubit extends Cubit<InjuryState> {
  final InjuryReportRepository _injuryReportRepository;

  InjuryCubit(this._injuryReportRepository) : super(InjuryInitial());

  Future<void> fetchanimals() async {
    emit(InjuryLoading());
    try {
      List<InjuryReportModel> injury =
          await _injuryReportRepository.getInjury();
      emit(InjurysLoaded(injuryreport: injury));
    } catch (e) {
      emit(InjuryError(e.toString()));
    }
  }

  Future<void> deleteinjury(String id) async {
    emit(InjuryLoading());
    try {
      await _injuryReportRepository.deleteInjuryReport(id);
    } catch (e) {
      emit(InjuryError(e.toString()));
    }
  }
}
