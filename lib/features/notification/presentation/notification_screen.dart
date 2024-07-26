import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:intl/intl.dart';

import '../../../core/theme/app_color.dart';
import '../application/notification_cubit.dart';
import '../application/notification_state.dart';
import '../domain/notification_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});
  static const route = '/notification-screen';

  @override
  // ignore: library_private_types_in_public_api
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  void _fetchNotifications() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      context.read<NotificationCubit>().fetchNotification(currentUser.uid);
    }
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMM d, yyyy h:mm a');
    return formatter.format(date);
  }

  void _deleteNotification(String notificationId) {
    context.read<NotificationCubit>().deleteNotification(notificationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.container,
      appBar: AppBar(
        backgroundColor: AppColor.container,
        elevation: 0,
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationError) {
            return Center(child: Text(state.message));
          } else if (state is NotificationLoaded) {
            if (state.notificationModel.isEmpty) {
              return const Center(child: Text('No notifications available'));
            } else {
              return ListView.builder(
                itemCount: state.notificationModel.length,
                itemBuilder: (context, index) {
                  NotificationModel notification =
                      state.notificationModel[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _deleteNotification(notification.userId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 218, 218, 218)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.telegram,
                            color: AppColor.primary,
                          ),
                        ),
                        title: Text(
                          notification.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(notification.message),
                        trailing: Text(
                          _formatDate(notification.date.toLocal()),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}
