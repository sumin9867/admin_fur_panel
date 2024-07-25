import 'package:admin_fur_care/core/utils.dart';
import 'package:admin_fur_care/features/incident/cubit/injury_cubit.dart';
import 'package:admin_fur_care/features/incident/domain/injury_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminIncidentDetailScreen extends StatelessWidget {
  final InjuryReportModel injuryReport;

  const AdminIncidentDetailScreen({
    super.key,
    required this.injuryReport,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = injuryReport.dateOfInjury;
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Injury Report Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  injuryReport.injuryPictureUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Cause of Injury: ${injuryReport.causeOfInjury}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${injuryReport.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Animal Type: ${injuryReport.animalType}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${injuryReport.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Injured Body Part: ${injuryReport.injuredBodyPart}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Contact Details: ${injuryReport.contactDetails}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Date of Injury: $formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  Utils.launchWhatsapp("+9779867811182", '''
Image:${injuryReport.injuryPictureUrl}
Cause of Injury: ${injuryReport.causeOfInjury}
Description: ${injuryReport.description}
Animal Type: ${injuryReport.animalType}
Location: ${injuryReport.location}
Injured Body Part: ${injuryReport.injuredBodyPart}
Contact Details: ${injuryReport.contactDetails}
Date of Injury: ${DateFormat('yyyy-MM-dd').format(injuryReport.dateOfInjury)}
''');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Send to Sneha Care',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<InjuryCubit>().deleteinjury(injuryReport.id);
                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Injury report deleted')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
