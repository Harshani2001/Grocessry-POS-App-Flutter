
import 'package:flutter/material.dart';
import 'package:mpos/features/checkout/ui/PaymentConfirmationScreen.dart';
class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedCardType = 'Credit'; // Initial selected payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a card',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your payment details below',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Which payment method?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildPaymentMethodButton(
                  title: 'Credit',
                  isSelected: selectedCardType == 'Credit',
                  onTap: () {
                    setState(() {
                      selectedCardType = 'Credit';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _buildPaymentMethodButton(
                  title: 'Debit',
                  isSelected: selectedCardType == 'Debit',
                  onTap: () {
                    setState(() {
                      selectedCardType = 'Debit';
                    });
                  },
                ),
                const SizedBox(width: 12),
                _buildPaymentMethodButton(
                  title: 'Cash on Delivery',
                  isSelected: selectedCardType == 'Cash on Delivery',
                  onTap: () {
                    setState(() {
                      selectedCardType = 'Cash on Delivery';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (selectedCardType != 'Cash on Delivery') ...[
              _buildTextField(label: "Card holder's name"),
              const SizedBox(height: 16),
              _buildTextField(label: 'Card number'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(label: 'Expiry'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(label: 'CVV'),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationScreen(amount:0,),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CD964),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  selectedCardType == 'Cash on Delivery' ? 'CONFIRM' : 'ADD',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF4CD964) : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF4CD964)
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF4CD964),
                        radius: 6,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF4CD964) : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            counterText: '',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4CD964)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
