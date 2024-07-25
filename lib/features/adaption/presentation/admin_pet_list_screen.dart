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
              return ListView.builder(
                itemCount: state.adminPetss.length,
                itemBuilder: (context, index) {
                  final pets = state.adminPetss[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(pets.imageUrl),
                      ),
                      title: Text(
                        'Pet Name: ${pets.name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            'Breed: Breed ${pets.breed}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Age: ${pets.age} years',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Health: ${pets.healthStatus} ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Gender: ${pets.gender} ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Contact: ${pets.contactNumber} ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: AppColor.danger,
                        onPressed: () {
                          context.read<AdminPetCubit>().deletepets(pets.id);
                          context.read<AdminPetCubit>().fetchPetss();
                        },
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else if (state is AdminPetsError) {
              return Center(
                child: Row(
                  children: [
                    Text(state.message),
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.try_sms_star))
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
