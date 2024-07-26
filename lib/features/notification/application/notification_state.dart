import '../domain/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notificationModel;

  NotificationLoaded({required this.notificationModel});
}

class NotificationSend extends NotificationState {}

class NotificationError extends NotificationState {
  final String message;

  NotificationError({required this.message});
}
