import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_cubit.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/application/cubit/admin_adoption_request_state.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/presentation/admin_adaption_request_detail.dart';
import 'package:admin_fur_care/features/adaption_requets_screen.dart/presentation/state_adaption.dart';

class AdminPetAdaptionRequestList extends StatefulWidget {
  const AdminPetAdaptionRequestList({super.key});

  @override
  State<AdminPetAdaptionRequestList> createState() =>
      _AdminPetAdaptionRequestListState();
}

class _AdminPetAdaptionRequestListState
    extends State<AdminPetAdaptionRequestList> {
  @override
  void initState() {
    context.read<AdminAdoptionRequestCubit>().fetchPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AdminAdoptionRequestCubit, AdminAdaptionRequestate>(
          builder: (context, state) {
            if (state is AdminAdaptionRequestLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AdminAdaptionRequestLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Pet Name')),
                          DataColumn(label: Text('User Name')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Gender')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: state.adminAdaptionRequest.map((pets) {
                          final statusProperties = StatusProperties.fromStatus(
                              pets.petAdoptionStatus ?? "");
                          return DataRow(
                            cells: [
                              DataCell(Text(pets.petName ?? "")),
                              DataCell(Text(pets.userName ?? "")),
                              DataCell(Row(
                                children: [
                                  Icon(
                                    statusProperties.icon,
                                    color: statusProperties.color,
                                    size: 18.0,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    statusProperties.text,
                                    style: TextStyle(
                                      color: statusProperties.color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(Text(pets.petGender ?? "")),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminAdaptionDetailScreen(
                                        petsModel: pets,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is AdminAdaptionRequestError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const Gap(10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AdminAdoptionRequestCubit>().fetchPets();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Something went wrong."));
            }
          },
        ),
      ),
    );
  }
}
