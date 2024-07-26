import 'package:admin_fur_care/features/adaption_requets_screen.dart/presentation/admin_adaption_request_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../adaption/application/cubit/admin_adaption_cubit.dart';
import '../adaption/application/cubit/admin_adaption_state.dart';
import '../auth/profile/application/cubit/profile_cubit_cubit.dart';
import '../auth/profile/application/cubit/profile_cubit_state.dart';
import '../incident/cubit/injury_cubit.dart';
import '../incident/cubit/injury_state.dart';
import '../users/application/cubit/user_detail_cubit.dart';
import '../users/application/cubit/user_detail_state.dart';
import '../users/presentation/user_detail_screen.dart';
import 'widget/total_container_box.dart'; // Import if needed

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];
  bool _large = true;

  void _updateSize() {
    setState(() {
      _large = !_large;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize data fetching once here
    context.read<UsersCubit>().getUsers();
    context.read<AdminPetCubit>().fetchPetss();
    context.read<InjuryCubit>().fetchanimals();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Text(formattedDate),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.notifications,
                            color: Colors.black87),
                        onPressed: () {},
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is ProfileLoaded) {
                            return CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              child: state.userModel.profileImageUrl != null
                                  ? Image.network(
                                      state.userModel.profileImageUrl!,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.person);
                                      },
                                    )
                                  : const Icon(Icons.person),
                            );
                          }
                          return const Icon(Icons.person);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.black12, height: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Row(
                        children: [
                          BlocBuilder<UsersCubit, UsersState>(
                            builder: (context, state) {
                              if (state is UsersLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is UsersLoaded) {
                                return CustomCard(
                                  color: colors[0],
                                  textColor: Colors.white,
                                  text: state.users.length.toString(),
                                  subText: 'Total Users',
                                );
                              } else if (state is UsersError) {
                                return Text(state.message);
                              }
                              return Container();
                            },
                          ),
                          BlocBuilder<InjuryCubit, InjuryState>(
                            builder: (context, state) {
                              if (state is InjuryLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is InjurysLoaded) {
                                return CustomCard(
                                  color: colors[1],
                                  textColor: Colors.white,
                                  text: state.injuryreport.length.toString(),
                                  subText: 'Incident Reported',
                                );
                              } else if (state is InjuryError) {
                                return Text(state.message);
                              }
                              return Container();
                            },
                          ),
                          BlocBuilder<UsersCubit, UsersState>(
                            builder: (context, state) {
                              if (state is UsersLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is UsersLoaded) {
                                return CustomCard(
                                  color: colors[2],
                                  textColor: Colors.white,
                                  text: state.users.length.toString(),
                                  subText: 'Left for Adoption',
                                );
                              } else if (state is UsersError) {
                                return Text(state.message);
                              }
                              return Container();
                            },
                          ),
                          BlocBuilder<AdminPetCubit, AdminPetState>(
                            builder: (context, state) {
                              if (state is AdminPetsLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is AdminPetssLoaded) {
                                return CustomCard(
                                  color: colors[3],
                                  textColor: Colors.white,
                                  text: state.adminPetss.length.toString(),
                                  subText: 'Vets in List',
                                );
                              } else if (state is AdminPetsError) {
                                return Text(state.message);
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildCard(
                            context,
                            'Pet Adoption Request List',
                            const AdminPetAdaptionRequestList(),
                          ),
                          const SizedBox(width: 16),
                          _buildCard(
                            context,
                            'Users List',
                            const AdminUserDetail(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget child) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
