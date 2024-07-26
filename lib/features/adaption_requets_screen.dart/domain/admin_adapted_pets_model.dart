class AdminAdoptedPetsModels {
  final String? petId;
  final String? adaptionid;
  final String? petName;
  final int? petAge;
  final String? petBreed;
  final String? petGender;
  final String? petLocation;
  final String? petContactNumber;
  final String? petImageUrl;
  final String? petDescription;
  final String? petHealthStatus;
  final String? petAdoptionStatus;
  final String? userId;
  final String? userName;
  final String? userEmail;

  AdminAdoptedPetsModels({
    this.petId,
    this.adaptionid,
    this.petName,
    this.petAge,
    this.petBreed,
    this.petGender,
    this.petLocation,
    this.petContactNumber,
    this.petImageUrl,
    this.petDescription,
    this.petHealthStatus,
    this.petAdoptionStatus,
    this.userId,
    this.userName,
    this.userEmail,
  });

  factory AdminAdoptedPetsModels.fromMap(
      Map<String, dynamic> data, String petId) {
    return AdminAdoptedPetsModels(
      petId: data['petId'],
      adaptionid: petId,
      petName: data['petName'],
      petAge: data['petAge'],
      petBreed: data['petBreed'],
      petGender: data['petGender'],
      petLocation: data['petLocation'],
      petContactNumber: data['petContactNumber'],
      petImageUrl: data['petImageUrl'],
      petDescription: data['petDescription'],
      petHealthStatus: data['petHealthStatus'],
      petAdoptionStatus: data['petAdoptionStatus']?.toString(),
      userId: data['userId'],
      userName: data['userName'],
      userEmail: data['userEmail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'petId': petId,
      'adaptionId': petId,
      'petName': petName,
      'petAge': petAge,
      'petBreed': petBreed,
      'petGender': petGender,
      'petLocation': petLocation,
      'petContactNumber': petContactNumber,
      'petImageUrl': petImageUrl,
      'petDescription': petDescription,
      'petHealthStatus': petHealthStatus,
      'petAdoptionStatus': petAdoptionStatus, // Already a string
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
    };
  }

  AdminAdoptedPetsModels copyWith({
    String? petId,
    String? adaptionId,
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
  }) {
    return AdminAdoptedPetsModels(
      petId: petId ?? this.petId,
      adaptionid: petId ?? this.petId,
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
