import 'package:flutter/material.dart';
import 'package:mpos/features/add_new_item/ui/add_new_food_screen.dart';

class AddSupplierPage extends StatelessWidget {
  const AddSupplierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplier Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Business Logo Placeholder
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.business,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  
                  ElevatedButton(
                    onPressed: () {
                      // Handle adding a business logo
                    },
                    style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 10, 41, 11), // Set text color to green
                   ),
                    child: const Text('Upload Business Logo'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: TextEditingController(),
              label: 'Business Name',
              hint: 'Enter your business name',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: TextEditingController(),
              label: 'Business ID',
              hint: 'Enter your business ID',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: TextEditingController(),
              label: 'Main Product',
              hint: 'Enter your main product',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: TextEditingController(),
              label: 'Address',
              hint: 'Enter your business address',
            ),
           
             const SizedBox(height: 16),
             
            // Dropdown for Business Size
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Small', child: Text('Small')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Large', child: Text('Large')),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Business Size',
                 labelStyle: TextStyle(color: Colors.black), // Label text color
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when not focused
                    borderRadius: BorderRadius.circular(10), // Rounded corners
             ),
              ),
            ),

            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Example 01', child: Text('Example 01')),
                DropdownMenuItem(value: 'Example 02', child: Text('Example 02')),
                DropdownMenuItem(value: 'Example 03', child: Text('Example 03')),
                DropdownMenuItem(value: 'Example 03', child: Text('Example 04')),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Product Category',
                 labelStyle: TextStyle(color: Colors.black), // Label text color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showAddProductWindow(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255,139,195,74),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150, 40), // Set width to 150 and height to 40
                  ),
                  child: const Text('Add Product'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save supplier information
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255,139,195,74),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150, 40), // Set width to 150 and height to 40
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black), // Label text color
        hintText: hint,
        enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.green, width: 0.5), // Green border when not focused
           borderRadius: BorderRadius.circular(10), // Rounded corners
       ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
      ),
    );
  }

  // Method to show the Add Product window
  void _showAddProductWindow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewFoodScreen (),
      ),
    );
  }
}

