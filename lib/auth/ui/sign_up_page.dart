import 'package:flutter/material.dart';
import 'package:mpos/features/add_new_item/ui/add_supplier_page.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _userType = 'Customer';
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Create New Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _usernameController,
                    label: 'User Name',
                    hint: 'Enter your username',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Re-enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 32),
                  _buildDropdown(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform sign-up logic
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
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
            borderSide: const BorderSide(color: Color.fromARGB(255, 133, 133, 133), width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(color: Colors.black),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget _buildDropdown() {
    return SizedBox(
      width: 400,
      child: DropdownButtonFormField<String>(
        value: _userType,
        items: const [
          DropdownMenuItem(value: 'Admin', child: Text('Admin')),
          DropdownMenuItem(value: 'Customer', child: Text('Customer')),
         // DropdownMenuItem(value: 'Supplier', child: Text('Supplier')),
        ],
        onChanged: (value) {
          setState(() {
            _userType = value!;
          });

          if (value == 'Supplier') {
            //_showPopupWindow(context);
          }
        },
        decoration: InputDecoration(
          labelText: 'Select User Type',
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          
          ),
        ),
      ),
    );
  }

 /*void _showPopupWindow(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Supplier Information'),
        content: const Text('Please proceed to add supplier details.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Close the dialog
              Navigator.push(
                context, // Use the parent widget's context
                MaterialPageRoute(
                  builder: (context) => const AddSupplierPage(),
                ),
              );
            },
            child: const Text('Proceed'),
          ),
        ],
      );
    },
  );
}*/
}


