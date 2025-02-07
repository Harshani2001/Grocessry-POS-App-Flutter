import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/features/user/bloc/edit_profile_event.dart';
import 'package:mpos/features/user/bloc/edit_profile_state.dart';
import 'package:mpos/features/user/bloc/edit_profile_bloc.dart';
import 'dart:io';
//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


class _EditProfileScreen extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isEditing = false;

  // Controllers
  final _firstNameController = TextEditingController(text: 'John');
  final _lastNameController = TextEditingController(text: 'Doe');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController(text: '011 07850269');
  final _whatsappController = TextEditingController(text: '011 0055632');
  final _dobController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, // Make AppBar white
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'User Profile ',
         
        style: TextStyle(fontSize: 18), // Move style inside Text
          ),
       
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                if (_formKey.currentState?.validate() ?? false) {
                  _saveProfile();
                }
              } else {
                setState(() => _isEditing = true);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _imageFile != null 
                          ? FileImage(_imageFile!) 
                          : null,
                      child: _imageFile == null 
                          ? const Icon(Icons.person, size: 50) 
                          : null,
                    ),
                    if (_isEditing)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 18,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                            onPressed: _pickImage,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              Row(
                children: [
                  
                Expanded(
                   child: TextFormField( 
                   controller: _firstNameController,
                   enabled: _isEditing,
                   decoration: InputDecoration(
                     labelText: 'First Name',
                     labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                     enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ),    
                 ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      enabled: _isEditing,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                        enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ),    
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _whatsappController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'WhatsApp Number',
                  
                  labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  
                  labelStyle: const TextStyle(color: Color(0xFF303030)),
                   // Dark grey label color
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _isEditing ? () => _selectDate(context) : null,
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please select date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Address Information',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _streetController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Street',
                   
                  labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                  
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cityController,
                      enabled: _isEditing,
                      decoration: InputDecoration(
                        labelText: 'City',
                          
                        labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                        enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _zipController,
                      enabled: _isEditing,
                      decoration: InputDecoration(
                        labelText: 'ZIP Code',
                          
                        labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                       enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                      ),
                    ),
                  ),
                ],
              ),
               const Text(
                '\n Add Card Information',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              if (_isEditing)
                
            Center(
              child: SizedBox(
               height: 40, // Set height to 40
                child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
               ),
              child: InputDecorator(
                           decoration: InputDecoration(
                           labelText: "Select Payment Method",
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), // Default Border
                           enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default border color (Gray)
                    borderRadius: BorderRadius.circular(8),
               ),
                 focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2), // Green when focused
                borderRadius: BorderRadius.circular(8),
             ),
          ),
               child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                        isExpanded: true,
                        value: null,
                                      hint: const Text("Select Payment Method"),
                                      style: TextStyle(fontSize: 14),
                items: ['Credit Card', 'Debit Card'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                 child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              _showPaymentMethodDialog(context, newValue);
            }
          },
        ),)
      ),
    ),
  ),
)

  

            ],
          ),
        ),
  
      ));
  
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _showPaymentMethodDialog(BuildContext context, String type) {
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set background color to white
          title: Text('Update $type Payment Method'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Card Holder Name',
                    labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                    enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                    enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                          enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          labelStyle: const TextStyle(color: Color(0xFF303030)), // Dark grey label color
                          enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide:BorderSide(color: Colors.grey.shade300),
                ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4CD964)), // Focused border color (green)
                ),
                   errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.red), // Red border for error
                ), 
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
           TextButton(
                child: const Text('Cancel'),
                style: TextButton.styleFrom(
                 backgroundColor: Colors.green, // Button color green
                 foregroundColor: Colors.white, // Text and icon color white
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
           ),
             ),
                onPressed: () => Navigator.pop(context),
             ),
           SizedBox(
                
                height: 30, // Set height
           child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Button color green
              foregroundColor: Colors.white, // Text and icon color white
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
        ),
        ),
            child: const Text('Save'),
            onPressed: () {
                   Navigator.pop(context);
                   ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text('$type card added successfully')),
                   
                   
        );
        
      },
    ),
  ),
  
],

        );
      },
    );
  }

  void _saveProfile() {
    setState(() => _isEditing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _dobController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }
}
