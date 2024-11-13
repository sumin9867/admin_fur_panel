import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_state.dart';
import 'package:admin_fur_care/features/incident/presentation/admin_incident_detail_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<InjuryCubit, InjuryState>(
          builder: (context, state) {
            if (state is InjuryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InjurysLoaded) {
              if (state.injuryreport.isEmpty) {
                return const Center(
                  child: Text("No Incident Listed"),
                );
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 1200 ? 3 : 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 2, // Adjust for better aspect ratio
                ),
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
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.report_problem,
                                  color: AppColor.primary,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  injury.actualLocation,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Incident Date: ${injury.dateOfInjury}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Reported by: ${injury.addedBy}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Status: ${injury.addedBy}',
                              style: TextStyle(
                                fontSize: 16,
                                color: injury.addedBy == 'Open'
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: AppColor.danger,
                                  onPressed: () {
                                    context
                                        .read<InjuryCubit>()
                                        .deleteinjury(injury.id);
                                    context.read<InjuryCubit>().fetchanimals();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: AppColor.primary,
                                  onPressed: () {
                                    // Edit functionality
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is InjuryError) {
              return Center(
                child: Text("Error fetching data: ${state.message}"),
              );
            } else {
              return const Center(child: Text("No Incident reported yet"));
            }
          },
        ),
      ),
    );
  }
}
