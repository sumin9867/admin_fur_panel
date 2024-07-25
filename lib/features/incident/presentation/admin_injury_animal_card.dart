import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/incident/domain/injury_report_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminIncidentAnimalsCard extends StatelessWidget {
  final InjuryReportModel injuryReports;
  // final Function(InjuryReportsModel) onTap;

  const AdminIncidentAnimalsCard({
    super.key,
    required this.injuryReports,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(injuryReports.dateOfInjury.toString());
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.box,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .04,
          vertical: MediaQuery.of(context).size.height * .01),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              injuryReports.injuryPictureUrl,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Failed to load image');
              },
            )),
        title: Text(
          injuryReports.causeOfInjury,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
