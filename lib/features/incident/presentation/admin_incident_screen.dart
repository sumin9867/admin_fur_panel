import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_state.dart';
import 'package:admin_fur_care/features/incident/presentation/admin_incident_detail_screen.dart';
import 'package:admin_fur_care/features/incident/presentation/admin_injury_animal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminIncidentScreen extends StatefulWidget {
  const AdminIncidentScreen({super.key});

  @override
  State<AdminIncidentScreen> createState() => _AdminIncidentScreenState();
}

class _AdminIncidentScreenState extends State<AdminIncidentScreen> {
  @override
  void initState() {
    context.read<InjuryCubit>().fetchanimals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.attendanceContainer,
      appBar: AppBar(
        title: const Text(
          'Incident List',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<InjuryCubit, InjuryState>(
        builder: (context, state) {
          if (state is InjuryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InjurysLoaded) {
            if (state.injuryreport.isEmpty) {
              return const Center(
                child: Text("No Pet Listed"),
              );
            }

            return ListView.builder(
                itemCount: state.injuryreport.length,
                itemBuilder: (context, index) {
                  final injury = state.injuryreport[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminIncidentDetailScreen(
                            injuryReport: injury,
                          ),
                        ),
                      );
                    },
                    child: AdminIncidentAnimalsCard(
                      injuryReports: injury,
                    ),
                  );
                });
          } else if (state is InjuryError) {
            return Center(
              child: Text("Error fecthing data ${state.message}"),
            );
          } else {
            return const Center(child: Text("No Incident reportrd till"));
          }
        },
      ),
    );
  }
}
