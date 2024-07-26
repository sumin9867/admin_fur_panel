class PetsModel {
  final String id;
  final String name;
  final int age;
  final String breed;
  final String gender;
  final String location;
  final String contactNumber;
  final String imageUrl;
  final String description;
  final String healthStatus;
  final String adoptionStatus;

  PetsModel({
    required this.id,
    required this.name,
    required this.age,
    required this.breed,
    required this.gender,
    required this.location,
    required this.contactNumber,
    required this.imageUrl,
    required this.description,
    required this.healthStatus,
    required this.adoptionStatus,
  });

  factory PetsModel.fromMap(Map<String, dynamic> data, String id) {
    return PetsModel(
      id: id,
      name: data['name'],
      age: data['age'],
      breed: data['breed'],
      gender: data['gender'],
      location: data['location'],
      contactNumber: data['contactNumber'],
      imageUrl: data['imageUrl'],
      description: data['description'],
      healthStatus: data['healthStatus'],
      adoptionStatus: data['adoptionStatus'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'breed': breed,
      'gender': gender,
      'location': location,
      'contactNumber': contactNumber,
      'imageUrl': imageUrl,
      'description': description,
      'healthStatus': healthStatus,
      'adoptionStatus': adoptionStatus,
    };
  }

  PetsModel copyWith({
    String? id,
    String? name,
    int? age,
    String? breed,
    String? gender,
    String? location,
    String? contactNumber,
    String? imageUrl,
    String? description,
    String? healthStatus,
    String? adoptionStatus,
  }) {
    return PetsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      contactNumber: contactNumber ?? this.contactNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      healthStatus: healthStatus ?? this.healthStatus,
      adoptionStatus: adoptionStatus ?? this.adoptionStatus,
    );
  }
}
