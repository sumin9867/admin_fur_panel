import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/users/application/cubit/user_detail_cubit.dart';
import 'package:admin_fur_care/features/users/application/cubit/user_detail_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminUserDetail extends StatelessWidget {
  const AdminUserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // More padding for web view
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersLoaded) {
              if (state.users.isEmpty) {
                return const Center(
                  child: Text("No Users Listed"),
                );
              }
              return ResponsiveLayout(
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      elevation: 6,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30, // Larger for web view
                          backgroundColor: Colors.grey[200],
                          child: ClipOval(
                            child: user.profileImageUrl != null &&
                                    user.profileImageUrl!.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: user.profileImageUrl!,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) => Text(
                                      user.name.characters.first.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : Text(
                                    user.name.characters.first.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 40.0, // Larger for web view
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text('Email: ${user.email}'),
                            Text('Location: ${user.location}'),
                            Text('ID: ${user.id}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is UsersError) {
              return Center(
                child: Text("Error fetching users: ${state.message}"),
              );
            } else {
              return Center(
                child: Text("Can't load data"),
              );
            }
          },
        ),
      ),
    );
  }
}

// Responsive layout widget
class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Web view
          return Row(
            children: [
              Expanded(
                child: child,
              ),
            ],
          );
        } else {
          // Mobile view
          return child;
        }
      },
    );
  }
}
