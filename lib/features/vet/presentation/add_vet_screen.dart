import 'dart:io';

import 'package:admin_fur_care/core/location_type.dart';
import 'package:admin_fur_care/core/widget/add_button_widget.dart';
import 'package:admin_fur_care/core/widget/pick_photo_button.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_cubit.dart';
import 'package:admin_fur_care/features/vet/application/cubit/admin_vet_state.dart';
import 'package:admin_fur_care/features/vet/domain/admin_vet_model.dart';
import 'package:admin_fur_care/features/vet/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddVetScreen extends StatefulWidget {
  const AddVetScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddVetScreenState createState() => _AddVetScreenState();
}

class _AddVetScreenState extends State<AddVetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _workingDaysController = TextEditingController();
  final TextEditingController _startDayController = TextEditingController();
  final TextEditingController _endDayController = TextEditingController();
  final TextEditingController _availableTimeController =
      TextEditingController();
  final TextEditingController _patientNumberController =
      TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File? _image;
  String? _selectedLocation;

  @override
  void dispose() {
    _nameController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _workingDaysController.dispose();
    _startDayController.dispose();
    _endDayController.dispose();
    _availableTimeController.dispose();
    _patientNumberController.dispose();
    _aboutMeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vet',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<AdminVetCubit, AdminVetState>(
          listener: (context, state) {
            if (state is AdminVetAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Vet details added successfully')),
              );
              Navigator.pop(context);
            } else if (state is AdminVetError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('Failed to add vet details: ${state.message}')),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                VetTextField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  textInputAction: TextInputAction.next,
                ),
                VetTextField(
                  controller: _educationController,
                  labelText: 'Education Quailification',
                  hint: "for example:Master In Veterinary",
                  textInputAction: TextInputAction.next,
                ),
                VetTextField(
                  controller: _experienceController,
                  hint: "for example: 5 ,6",
                  labelText: 'Experience years',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                VetTextField(
                  controller: _workingDaysController,
                  labelText: 'Total Working Days in Week',
                  textInputAction: TextInputAction.next,
                ),
                VetTextField(
                  controller: _startDayController,
                  labelText: 'Enter Start Day',
                  hint: "for example:Sunday,Monday....",
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .02),
                  child: const Text("to"),
                ),
                VetTextField(
                  controller: _endDayController,
                  labelText: 'Enter End Day',
                  textInputAction: TextInputAction.next,
                  hint: "for example:Friday,Saturday....",
                ),
                VetTextField(
                  controller: _availableTimeController,
                  labelText: 'Working hours',
                  hint: "for example: 9am - 5pm",
                  textInputAction: TextInputAction.next,
                ),
                VetTextField(
                  controller: _patientNumberController,
                  labelText: 'Number of Patients Deal with till now ',
                  hint: "for example:40, 50",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                VetTextField(
                  controller: _aboutMeController,
                  labelText: 'About Me',
                  textInputAction: TextInputAction.next,
                  maxLength: 400,
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
                  controller: _phoneNumberController,
                  labelText: 'Contact Details',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  hint: "98********",
                ),
                if (_image != null) Image.file(_image!),
                TakePhotoButton(onPressed: _pickImage),
                const SizedBox(height: 10),
                AddButtonWidget(
                  onPressed: _addVet,
                  label: 'Add Pet',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addVet() {
    if (_formKey.currentState!.validate() &&
        _image != null &&
        _selectedLocation != null) {
      AdminVetModel vet = AdminVetModel(
        id: '',
        name: _nameController.text,
        education: _educationController.text,
        experience: int.parse(_experienceController.text),
        workingDays: _workingDaysController.text,
        startDay: _startDayController.text,
        endDay: _endDayController.text,
        availableTime: _availableTimeController.text,
        imageUrl: '',
        totalPatients: int.parse(_patientNumberController.text),
        aboutMe: _aboutMeController.text,
        location: _selectedLocation!,
        phoneNumber: _phoneNumberController.text,
      );

      context.read<AdminVetCubit>().addVet(vet, _image!);
    }
  }
}
