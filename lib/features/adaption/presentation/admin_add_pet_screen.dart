import 'dart:typed_data';
import 'package:admin_fur_care/core/location_type.dart';
import 'package:admin_fur_care/core/theme/responsive_size.dart';
import 'package:admin_fur_care/core/widget/pick_photo_button.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_cubit.dart';
import 'package:admin_fur_care/features/adaption/application/cubit/admin_adaption_state.dart';
import 'package:admin_fur_care/features/adaption/domain/admin_pet_model.dart';
import 'package:admin_fur_care/features/adaption/presentation/adaption_button.dart';
import 'package:admin_fur_care/features/vet/presentation/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _healthStatusController = TextEditingController();
  final TextEditingController _adoptionStatusController =
      TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  Uint8List? _imageBytes;
  String? _selectedLocation;
  String? _selectedGender;

  final List<String> gender = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _breedController.dispose();
    _descriptionController.dispose();
    _healthStatusController.dispose();
    _adoptionStatusController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _imageBytes = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<AdminPetCubit, AdminPetState>(
          listener: (context, state) {
            if (state is AdminPetsAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pet details added successfully')),
              );
              Navigator.pop(context);
              context.read<AdminPetCubit>().fetchPetss();
            } else if (state is AdminPetsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('Failed to add pet details: ${state.message}')),
              );
            }
          },
          child: SizedBox(
            width: ScreenUtils.getWidth(context, 1),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  VetTextField(
                    controller: _nameController,
                    labelText: 'Name',
                    textInputAction: TextInputAction.next,
                  ),
                  VetTextField(
                    controller: _ageController,
                    labelText: 'Age',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  VetTextField(
                    controller: _breedController,
                    labelText: 'Breed',
                    textInputAction: TextInputAction.next,
                  ),
                  VetTextField(
                    controller: _descriptionController,
                    labelText: 'Description',
                    textInputAction: TextInputAction.next,
                    maxLength: 400,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                    ),
                    items: gender.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Gender is required' : null,
                  ),
                  VetTextField(
                    controller: _healthStatusController,
                    labelText: 'Health Status',
                    textInputAction: TextInputAction.next,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedLocation,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                    ),
                    items: LocationService.locations.map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Location is required' : null,
                  ),
                  VetTextField(
                    controller: _contactNumberController,
                    labelText: 'Contact Number',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                  ),
                  if (_imageBytes != null) Image.memory(_imageBytes!),
                  TakePhotoButton(onPressed: _pickImage),
                  const SizedBox(height: 10),
                  AdaptionButtton(onPressed: _addPet, label: "Add Pet"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addPet() {
    if (_formKey.currentState!.validate() &&
        _imageBytes != null &&
        _selectedLocation != null) {
      AdminPetsModel pet = AdminPetsModel(
        id: '',
        name: _nameController.text,
        age: int.parse(_ageController.text),
        breed: _breedController.text,
        location: _selectedLocation!,
        contactNumber: _contactNumberController.text,
        imageUrl: '',
        description: _descriptionController.text,
        healthStatus: _healthStatusController.text,
        adoptionStatus: "0",
        gender: _selectedGender!,
      );

      context.read<AdminPetCubit>().addPets(pet, _imageBytes!, "kmsdncmdcn");
    }
  }
}
