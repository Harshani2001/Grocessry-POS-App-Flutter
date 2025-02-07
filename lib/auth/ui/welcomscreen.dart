import 'package:flutter/material.dart';
import 'package:mpos/auth/ui/sign_in_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,139,195,74),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Shopping Cart Image
                SizedBox(
                 height: 50,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/p.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),


                
                // Let's Start Button
                SizedBox(
                  
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the Home screen when the button is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255,139,195,74),
                     
                     
                        
                      
                    ),
                    child: const Text(
                      'Let\'s Start',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
