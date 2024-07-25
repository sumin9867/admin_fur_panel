import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_state.dart';
import 'package:admin_fur_care/features/vet/presentation/add_vet_screen.dart';
import 'package:admin_fur_care/features/vet/presentation/widgets/admin_vet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminVetListScreen extends StatefulWidget {
  const AdminVetListScreen({super.key});

  @override
  State<AdminVetListScreen> createState() => _AdminVetListScreenState();
}

class _AdminVetListScreenState extends State<AdminVetListScreen> {
  @override
  void initState() {
    context.read<AdminVetCubit>().fetchVets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet List'),
      ),
      body: BlocBuilder<AdminVetCubit, AdminVetState>(
        builder: (context, state) {
          print(state);
          if (state is AdminVetLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdminVetsLoaded) {
            if (state.adminvets.isEmpty) {
              return const Center(
                child: Text("No Pet Listed"),
              );
            }
            return ListView.builder(
              itemCount: state.adminvets.length,
              itemBuilder: (context, index) {
                final vet = state.adminvets[index];
                return AdminVetCard(
                  vet: vet,
                );
              },
            );
          } else if (state is AdminVetError) {
            return Center(child: Text(state.message));
          } else {
            context.read<AdminVetCubit>().fetchVets();
            return const Center(child: Text('No vets available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddVetScreen(),
            ),
          );
        },
        tooltip: 'Add Vet',
        child: const Icon(
          Icons.add,
          color: AppColor.button,
        ),
      ),
    );
  }
}
