class AdoptedPetsModels {
  final String petId;
  final String petName;
  final int petAge;
  final String petBreed;
  final String petGender;
  final String petLocation;
  final String petContactNumber;
  final String petImageUrl;
  final String petDescription;
  final String petHealthStatus;
  final String petAdoptionStatus;

  final String userId;
  final String userName;
  final String userEmail;

  AdoptedPetsModels({
    required this.petId,
    required this.petName,
    required this.petAge,
    required this.petBreed,
    required this.petGender,
    required this.petLocation,
    required this.petContactNumber,
    required this.petImageUrl,
    required this.petDescription,
    required this.petHealthStatus,
    required this.petAdoptionStatus,
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  factory AdoptedPetsModels.fromMap(
    Map<String, dynamic> data,
  ) {
    return AdoptedPetsModels(
      petId: data['petId'],
      petName: data['petName'],
      petAge: data['petAge'],
      petBreed: data['petBreed'],
      petGender: data['petGender'],
      petLocation: data['petLocation'],
      petContactNumber: data['petContactNumber'],
      petImageUrl: data['petImageUrl'],
      petDescription: data['petDescription'],
      petHealthStatus: data['petHealthStatus'],
      petAdoptionStatus: data['petAdoptionStatus'].toString(),
      userId: data['userId'],
      userName: data['userName'],
      userEmail: data['userEmail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'petId': petId,
      'petName': petName,
      'petAge': petAge,
      'petBreed': petBreed,
      'petGender': petGender,
      'petLocation': petLocation,
      'petContactNumber': petContactNumber,
      'petImageUrl': petImageUrl,
      'petDescription': petDescription,
      'petHealthStatus': petHealthStatus,
      'petAdoptionStatus': petAdoptionStatus,
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
    };
  }

  AdoptedPetsModels copyWith({
    String? petId,
    String? petName,
    int? petAge,
    String? petBreed,
    String? petGender,
    String? petLocation,
    String? petContactNumber,
    String? petImageUrl,
    String? petDescription,
    String? petHealthStatus,
    String? petAdoptionStatus,
    String? userId,
    String? userName,
    String? userEmail,
    String? userLocation,
    String? userProfileImageUrl,
  }) {
    return AdoptedPetsModels(
      petId: petId ?? this.petId,
      petName: petName ?? this.petName,
      petAge: petAge ?? this.petAge,
      petBreed: petBreed ?? this.petBreed,
      petGender: petGender ?? this.petGender,
      petLocation: petLocation ?? this.petLocation,
      petContactNumber: petContactNumber ?? this.petContactNumber,
      petImageUrl: petImageUrl ?? this.petImageUrl,
      petDescription: petDescription ?? this.petDescription,
      petHealthStatus: petHealthStatus ?? this.petHealthStatus,
      petAdoptionStatus: petAdoptionStatus ?? this.petAdoptionStatus,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
