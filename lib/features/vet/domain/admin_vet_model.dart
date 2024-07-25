// models/AdminVetModel.dart
class AdminVetModel {
  final String id;
  final String name;
  final String education;
  final int experience;
  final String workingDays;
  final String startDay;
  final String endDay;
  final String availableTime;
  final String imageUrl;
  final int totalPatients;
  final String aboutMe;
  final String location;
  final String phoneNumber;

  AdminVetModel({
    required this.id,
    required this.name,
    required this.education,
    required this.experience,
    required this.workingDays,
    required this.startDay,
    required this.endDay,
    required this.availableTime,
    required this.imageUrl,
    required this.totalPatients,
    required this.aboutMe,
    required this.location,
    required this.phoneNumber,
  });

  factory AdminVetModel.fromMap(Map<String, dynamic> data, String id) {
    return AdminVetModel(
      id: id,
      name: data['name'],
      education: data['education'],
      experience: data['experience'],
      workingDays: data['workingDays'],
      startDay: data['startDay'],
      endDay: data['endDay'],
      availableTime: data['availableTime'],
      imageUrl: data['imageUrl'],
      totalPatients: data['totalPatients'],
      aboutMe: data['aboutMe'],
      location: data['location'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'education': education,
      'experience': experience,
      'workingDays': workingDays,
      'startDay': startDay,
      'endDay': endDay,
      'availableTime': availableTime,
      'imageUrl': imageUrl,
      'totalPatients': totalPatients,
      'aboutMe': aboutMe,
      'location': location,
      'phoneNumber': phoneNumber,
    };
  }

  AdminVetModel copyWith({
    String? id,
    String? name,
    String? education,
    int? experience,
    String? workingDays,
    String? startDay,
    String? endDay,
    String? availableTime,
    String? imageUrl,
    int? totalPatients,
    String? aboutMe,
    String? location,
    String? phoneNumber,
  }) {
    return AdminVetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      workingDays: workingDays ?? this.workingDays,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      availableTime: availableTime ?? this.availableTime,
      imageUrl: imageUrl ?? this.imageUrl,
      totalPatients: totalPatients ?? this.totalPatients,
      aboutMe: aboutMe ?? this.aboutMe,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
