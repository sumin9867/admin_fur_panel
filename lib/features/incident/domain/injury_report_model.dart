class InjuryReportModel {
  final String id;
  final String causeOfInjury;
  final String injuryPictureUrl;
  final String animalType;
  final String location;
  final String description;
  final String contactDetails;
  final String injuredBodyPart;
  final DateTime dateOfInjury;
  final String? addedBy;
  final String? userImage;
  final String actualLocation;

  InjuryReportModel({
    required this.id,
    required this.causeOfInjury,
    required this.injuryPictureUrl,
    required this.animalType,
    required this.location,
    required this.description,
    required this.contactDetails,
    required this.injuredBodyPart,
    required this.dateOfInjury,
    required this.actualLocation,
    this.addedBy,
    this.userImage,
  });

  factory InjuryReportModel.fromMap(Map<String, dynamic> data, String id) {
    return InjuryReportModel(
      id: id,
      causeOfInjury: data['causeOfInjury'],
      injuryPictureUrl: data['injuryPictureUrl'],
      animalType: data['animalType'],
      location: data['location'],
      description: data['description'],
      contactDetails: data['contactDetails'],
      injuredBodyPart: data['injuredBodyPart'],
      dateOfInjury: DateTime.parse(data['dateOfInjury']),
      actualLocation: data['actualLocation'],
      addedBy: data['addedBy'],
      userImage: data['userImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'causeOfInjury': causeOfInjury,
      'injuryPictureUrl': injuryPictureUrl,
      'animalType': animalType,
      'location': location,
      'description': description,
      'contactDetails': contactDetails,
      'injuredBodyPart': injuredBodyPart,
      'dateOfInjury': dateOfInjury.toIso8601String(),
      'actualLocation': actualLocation,
      'addedBy': addedBy,
      'userImage': userImage,
    };
  }

  InjuryReportModel copyWith({
    String? id,
    String? causeOfInjury,
    String? injuryPictureUrl,
    String? animalType,
    String? location,
    String? description,
    String? contactDetails,
    String? injuredBodyPart,
    DateTime? dateOfInjury,
    String? addedBy,
    String? userImage,
    String? actualLocation,
  }) {
    return InjuryReportModel(
      id: id ?? this.id,
      causeOfInjury: causeOfInjury ?? this.causeOfInjury,
      injuryPictureUrl: injuryPictureUrl ?? this.injuryPictureUrl,
      animalType: animalType ?? this.animalType,
      location: location ?? this.location,
      description: description ?? this.description,
      contactDetails: contactDetails ?? this.contactDetails,
      injuredBodyPart: injuredBodyPart ?? this.injuredBodyPart,
      dateOfInjury: dateOfInjury ?? this.dateOfInjury,
      actualLocation: actualLocation ?? this.actualLocation,
      addedBy: addedBy ?? this.addedBy,
      userImage: userImage ?? this.userImage,
    );
  }
}
