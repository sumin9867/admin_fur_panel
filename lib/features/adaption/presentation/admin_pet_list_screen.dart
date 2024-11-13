import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_cubit.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_state.dart';
import 'package:admin_fur_care/features/adaption/presentation/admin_add_pet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPetAdaptionList extends StatefulWidget {
  const AdminPetAdaptionList({super.key});

  @override
  State<AdminPetAdaptionList> createState() => _AdminPetAdaptionListState();
}

class _AdminPetAdaptionListState extends State<AdminPetAdaptionList> {
  @override
  void initState() {
    context.read<AdminPetCubit>().fetchPetss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Adoption List',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AdminPetCubit, AdminPetState>(
          builder: (context, state) {
            if (state is AdminPetsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AdminPetssLoaded) {
              if (state.adminPetss.isEmpty) {
                return const Center(
                  child: Text("No Pet Listed"),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,

                  // Adjusted for better aspect ratio
                ),
                itemCount: state.adminPetss.length,
                itemBuilder: (context, index) {
                  final pets = state.adminPetss[index];

                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            pets.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    pets.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: AppColor.danger,
                                    onPressed: () {
                                      context
                                          .read<AdminPetCubit>()
                                          .deletepets(pets.id);
                                      context
                                          .read<AdminPetCubit>()
                                          .fetchPetss();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.pets, color: Colors.blue),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Breed: ${pets.breed}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.cake, color: Colors.pink),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Age: ${pets.age} years',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.local_hospital,
                                      color: Colors.red),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Health: ${pets.healthStatus}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.transgender,
                                      color: Colors.orange),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Gender: ${pets.gender}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.phone, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Contact: ${pets.contactNumber}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is AdminPetsError) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPetScreen(),
            ),
          );
        },
        backgroundColor: AppColor.primary,
        child: const Icon(
          Icons.add,
          color: AppColor.button,
        ),
      ),
    );
  }
}
