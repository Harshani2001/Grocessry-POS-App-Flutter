import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/auth/ui/sign_up_page.dart';
import 'package:mpos/features/add_new_item/ui/add_supplier_page.dart';
import 'package:mpos/features/add_new_item/ui/add_new_food_screen.dart';
import 'package:mpos/features/home/ui/home.dart';

import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_event.dart';
import '../bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage!)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in Your Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email Field
                    Container(
                      width: 350, // Set desired width
                      height: 45, // Set desired height
                      child: TextField(
                        onChanged: (email) => context.read<SignInBloc>().add(EmailChanged(email)),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black), // Label text color
                          hintText: 'youremail@gmail.com', // Placeholder text
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when not focused
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when focused
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                          filled: true, // Enables background fill color
                          fillColor: const Color.fromARGB(160, 247, 247, 247), // Light gray background color
                        ),
                        style: TextStyle(color: Colors.black), // Input text color
                      ),
                    ),
                    SizedBox(height: 16),

                    // Password Field
                    Container(
                      height: 45,  // Set the height for the text field
                      width: 350,  // Set the width to fill the available space
                      child: TextField(
                        onChanged: (password) => context.read<SignInBloc>().add(PasswordChanged(password)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: '********',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(160, 247, 247, 247),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 35),

                    // Sign-In Button
                    BlocListener<SignInBloc, SignInState>(
                      listener: (context, state) {
                        if (state.isAuthenticated) {
                          Navigator.pushNamed(context, '/home');
                        }
                        if (state.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage!)),
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                context.read<SignInBloc>().add(SignInSubmitted());
                              },
                        child: state.isSubmitting
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Sign In'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          fixedSize: const Size(200, 40),
                        ),
                      ),
                    ),

                    // Admin Login
                    Text(
                      '\n or Sign in as an Admin',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            fixedSize: const Size(200, 40),
                          ),
                          onPressed: () {
                            _showLoginDialog(context);
                          },
                          child: Text('Admin Login'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Sign-up Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\n  Don't have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 2),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            '\n Sign up',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Admin Login'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black), // Label text color
                hintText: 'Enter your username',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when not focused
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.green, width: 1),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black), // Label text color
                hintText: 'Enter your password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when not focused
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.green, width: 1),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Text color for the Cancel button
             ),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (usernameController.text == 'admin' &&
                  passwordController.text == 'admin123') {
                Navigator.of(context).pop(); // Close the dialog
                _showSecondPopup(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Invalid credentials!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 40, 166, 45), // Button color
              foregroundColor: Colors.white, // Text color
              fixedSize: const Size(150, 40), // Button size
            ),
            child: Text('Login'),
          ),
        ],
      );
    },
  );
}

// Second popup with 3 buttons: Add Supplier, Add New Food Items, Look After
void _showSecondPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose an Action'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>Home(), // Replace with your screen's class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 166, 45), // Button color
                foregroundColor: Colors.white, // Text color
                fixedSize: const Size(250, 50), // Button size
              ),
              child: Text('Look After'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewFoodScreen(), // Replace with your screen's class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 166, 45), // Button color
                foregroundColor: Colors.white, // Text color
                fixedSize: const Size(250, 50), // Button size
              ),
              child: Text('Add New Food Items'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddSupplierPage(), // Replace with your screen's class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 166, 45), // Button color
                foregroundColor: Colors.white, // Text color
                fixedSize: const Size(250, 50), // Button size
              ),
              child: Text('Add Supplier'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, // Text color for the Cancel button
            ),
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}}
