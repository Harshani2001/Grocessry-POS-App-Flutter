import 'package:flutter/material.dart';
import 'package:mpos/features/cart/ui/cart.dart';
import 'package:mpos/features/home/ui/home.dart';
import 'package:mpos/features/user/ui/edit_profile_screen.dart';
import 'package:mpos/features/wishlist/ui/wishlist.dart';
//import 'package:mpos/features/checkout/ui/checkout_tile_widget.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override

Widget build(BuildContext context) {
  return Drawer(
    child: Container(
      color: const Color.fromARGB(233, 90, 86, 86),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 48),
          // Profile section with Edit button
          ListTile(
            leading: Container(
              width: 50, 
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color.fromARGB(255, 25, 26, 25)),
              ),
            ),
            title: const Text(
              'Hello,\nUser Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
               
              ),
            ),
            trailing: TextButton.icon(
              icon: const Icon(Icons.edit, color: Colors.white, size: 18),
              label: const Text(
                "Edit",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: ()
               {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
                print("Edit Profile button clicked");
              },
            ),
          ),
        
          const SizedBox(height: 20),
          // Navigation items
          _buildNavItem(Icons.home, 'Home', context),
          _buildNavItem(Icons.shopping_cart, 'My Cart', context),
          _buildNavItem(Icons.history, 'Order History', context),
          _buildNavItem(Icons.local_offer, 'Discount', context),
          _buildNavItem(Icons.wallet, 'Wallet', context),
          _buildNavItem(Icons.favorite, 'Favorites', context),
          _buildNavItem(Icons.support_agent, 'Support', context),
          _buildNavItem(Icons.settings, 'Settings', context),
          _buildNavItem(Icons.logout, 'Logout', context),
        ],
      ),
    ),
  );
}

Widget _buildNavItem(IconData icon, String title, BuildContext context) {
  return ListTile(
    leading: Icon(
      icon,
      color: const Color.fromARGB(255, 255, 255, 255),
      size: 22,
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 14,
      ),
    ),
    onTap: () {
      // Close the drawer before navigating
      Navigator.pop(context);
      
      // Handle navigation based on the selected item
      _navigateToScreen(title, context);
    },
  );
}

void _navigateToScreen(String title, BuildContext context) {
  Widget screen;

  switch (title) {
    case 'Home':
      screen = Home(); // Replace with your actual Home screen widget
      break;
    case 'My Cart':
      screen = Cart(); // Define CartScreen widget
      break;
    case 'Favorites':
      screen = Wishlist(); // Define FavoritesScreen widget
      break;
   /* case 'Order History':
      screen = OrderHistoryScreen(); // Define OrderHistoryScreen widget
      break;
    
    case 'Wallet':
      screen = WalletScreen(); // Define WalletScreen widget
      break;
    case 'FAQs':
      screen = FaqScreen(); // Define FaqScreen widget
      break;
    case 'Support':
      screen = SupportScreen(); // Define SupportScreen widget
      break;
    case 'Settings':
      screen = SettingsScreen(); // Define SettingsScreen widget
      break;
    case 'Logout':
      screen = LogoutScreen(); // Define LogoutScreen widget
      break;*/
    default:
      screen = Home(); // Default screen if no match
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
}