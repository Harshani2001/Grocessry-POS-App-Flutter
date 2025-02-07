import 'package:flutter/material.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final double amount;

  const PaymentConfirmationScreen({
    Key? key, 
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 151, 47),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Amount display
            Text(
              'Rs.${amount.toStringAsFixed(2)}', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 32, 
                fontWeight: FontWeight.bold
              ),
            ),
            
            SizedBox(height: 16),
            
            // Thanks message
            Text(
              'Thanks !', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24
              ),
            ),
            
            SizedBox(height: 32),
            
            // Confirmation icon
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.check, 
                color: Colors.green, 
                size: 60
              ),
            ),
            
            SizedBox(height: 32),
            
            // Thanks purchasing message
            Text(
              'Thanks for your purchase', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18
              ),
            ),
            
            SizedBox(height: 32),
            
            // Continue shopping button
            ElevatedButton(
              onPressed: () {
                // Add navigation logic to continue shopping
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
              child: Text(
                'CONTINUE SHOPPING', 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
