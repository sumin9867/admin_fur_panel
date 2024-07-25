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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            print(state);
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: AppColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total Users: ${state.users.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          elevation: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[200],
                              child: ClipOval(
                                child: user.profileImageUrl != null &&
                                        user.profileImageUrl!.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: user.profileImageUrl!,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Text(
                                          user.name.characters.first
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                        user.name.characters.first
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            title: Text(
                              user.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text('Email: ${user.email}'),
                                Text('Location: ${user.location}'),
                                Text('ID: ${user.id}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is UsersError) {
              return Center(
                child: Text("Error fetching users ${state.message}"),
              );
            } else {
              return Container(
                child: Text("cant load"),
              );
            }
          },
        ),
      ),
    );
  }
}
