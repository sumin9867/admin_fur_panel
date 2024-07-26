import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/notification_model.dart';
import '../infrastructure/notification_repositary.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepositary notificationRepositary;
  NotificationCubit({required this.notificationRepositary})
      : super(NotificationInitial());

  Future<void> sendNotification(
      {required NotificationModel notificationModel}) async {
    emit(NotificationInitial());
    try {
      await notificationRepositary.addNotification(notificationModel);
      emit(NotificationInitial());
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }

  // Future<void> approvePetAdoption(petId) async {
  //   emit(PetsLoading());
  //   try {
  //     await _petsRepository.approvePetAdaption(petId);
  //     emit(PetsApproved());
  //   } catch (e) {
  //     emit(PetsError(e.toString()));
  //   }
  // }
  Future<void> fetchNotification(String userid) async {
    emit(NotificationInitial());
    try {
      List<NotificationModel> notificationModel =
          await notificationRepositary.fetchNotifications(userid);
      emit(NotificationLoaded(notificationModel: notificationModel));
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }

  Future<void> deleteNotification(String id) async {
    emit(NotificationInitial());
    try {
      await notificationRepositary.deleteNotification(id);
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }
  // Future<void> rejectedPetAdoption(petId) async {
  //   emit(PetsLoading());
  //   try {
  //     await _petsRepository.rejectPetAdaption(petId);
  //     emit(PetsApproved());
  //   } catch (e) {
  //     emit(PetsError(e.toString()));
  //   }
  // }
}
