import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/features/add_new_item/bloc/add_item_bloc.dart';
import 'package:mpos/features/add_new_item/bloc/add_item_event.dart';
import 'package:mpos/features/add_new_item/bloc/add_item_state.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddNewFoodScreen extends StatefulWidget {
  const AddNewFoodScreen({Key? key}) : super(key: key);

  @override
  _AddNewFoodScreenState createState() => _AddNewFoodScreenState();
}

class _AddNewFoodScreenState extends State<AddNewFoodScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController subcategoryController = TextEditingController();

  DateTime? expiryDate;
  File? _image;

  // List of subcategories for the dropdown
  final List<String> subcategories = ['Ex 01', 'Ex 02', 'Ex 03'];
  String? selectedSubcategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Food'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Food Name TextField
              _buildTextField(
                controller: nameController,
                label: 'Food Name',
                hint: 'Enter food name',
              ),
              const SizedBox(height: 16),

              // Price TextField
              _buildTextField(
                controller: priceController,
                label: 'Price',
                hint: 'Enter food price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Description TextField
              _buildTextField(
                controller: descriptionController,
                label: 'Description',
                hint: 'Enter food description',
              ),
              const SizedBox(height: 16),

              // Unit TextField
              _buildTextField(
                controller: unitController,
                label: 'Unit (e.g., 1kg)',
                hint: 'Enter unit',
              ),
              const SizedBox(height: 16),

              // Expiry Date Picker
              GestureDetector(
                onTap: _pickExpiryDate,
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: TextEditingController(
                        text: expiryDate == null
                            ? ''
                            : DateFormat('dd/MM/yyyy').format(expiryDate!)),
                    label: 'Expiry Date',
                    hint: 'Pick expiry date',
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Subcategory Dropdown
              _buildDropdownField(),

              const SizedBox(height: 16),

              // Image Upload
              _buildImageUpload(),

              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build TextFields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(color: Colors.black),
        ),
        keyboardType: keyboardType,
      ),
    );
  }

  // Method to build the subcategory dropdown
  Widget _buildDropdownField() {
    return SizedBox(
      width: 400,
      child: DropdownButtonFormField<String>(
        value: selectedSubcategory,
        onChanged: (value) {
          setState(() {
            selectedSubcategory = value;
          });
        },
        items: subcategories
            .map((subcategory) => DropdownMenuItem(
                  value: subcategory,
                  child: Text(subcategory),
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: 'Subcategory',
          hintText: 'Select subcategory',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  // Method to pick expiry date using DatePicker
  Future<void> _pickExpiryDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        expiryDate = pickedDate;
      });
    }
  }

  // Method to upload an image using Image Picker
  Widget _buildImageUpload() {
    return Row(
      children: [
        _image == null
            ? const Text('No image selected')
            : Image.file(_image!, width: 100, height: 100),
        IconButton(
          icon: const Icon(Icons.upload_file),
          onPressed: _pickImage,
        ),
      ],
    );
  }

  // Method to pick an image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to submit the form
  void _submitForm() {
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        unitController.text.isEmpty ||
        selectedSubcategory == null ||
        expiryDate == null) {
      // Show an error message or handle validation failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    } else {
      // Submit the form data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Food item added successfully!')),
      );
    }
  }
}
