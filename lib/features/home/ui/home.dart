import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/features/cart/ui/cart.dart';
import 'package:mpos/features/home/bloc/home_bloc.dart';
import 'package:mpos/features/home/ui/product_tile_widget.dart';
import 'package:mpos/features/wishlist/ui/wishlist.dart';
import 'custom_navigation_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCategoryIndex = 0; // Initially set to 0 for the "All Items" category
  List<String> categories = ['All Items', 'Grains', 'Vegetables', 'Spices'];

  late final HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Item Carted',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(255, 115, 116, 115),
            ),
          );
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Item Wishlisted',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(255, 115, 116, 115),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255,139,195,74),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  ),
                ],
              ),
              drawer: CustomNavigationDrawer(),
              body: Column(
                children: [
                  // Categories Row
                  Container(
                    color: const Color.fromARGB(255,139,195,74),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: categories.asMap().entries.map((entry) {
                        int index = entry.key;
                        String category = entry.value;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index; // Select the category
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedCategoryIndex == index
                                  ? const Color.fromARGB(255, 169, 210, 122)
                                  : const Color.fromARGB(255,139,195,74),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 12),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: selectedCategoryIndex == index
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(222, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Product List View
                  Expanded(
                    child: ListView.builder(
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                          homeBloc: homeBloc,
                          productDataModel: successState.products[index],
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Footer Navigation Bar
              bottomNavigationBar: Container(
                color: const Color.fromARGB(255,139,195,74),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   _buildFooterIcon(Icons.home, 'Home', () {
                      // Handle Home Navigation
                    }),
                    _buildFooterIcon(Icons.receipt, 'Order', () {
                      // Handle Order Navigation
                    }),
                     _buildFooterIcon(Icons.account_balance_wallet, 'Wallet', () {
                      // Handle Wallet Navigation
                    }),
                    _buildFooterIcon(Icons.payment, 'Payment', () {
                      // Handle Payment Navigation
                    }),
                  ],
                ),
              ),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));

          default:
            return SizedBox();
        }
      },
    );
  }

  // Footer Icon Builder
  Widget _buildFooterIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


