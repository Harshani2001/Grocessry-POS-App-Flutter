import 'package:flutter/material.dart';
import 'package:mpos/features/home/bloc/home_bloc.dart';
import 'package:mpos/features/home/models/home_product_data_model.dart';

class ProductGridWidget extends StatelessWidget {
  final List<ProductDataModel> products;
  final HomeBloc homeBloc;

  const ProductGridWidget({
    super.key,
    required this.products,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600
        ? 3
        : 2; // Use 3 columns for larger screens, 2 columns for smaller screens

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: products.isEmpty
          ? const Center(child: Text('No products available'))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    crossAxisCount, // Dynamically set based on screen width
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio:
                    20 / 16, // You can adjust this for better visual fit
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTileWidget(
                  productDataModel: product,
                  homeBloc: homeBloc,
                );
              },
            ),
    );
  }
}

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(206, 209, 209, 209)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "LKR ${productDataModel.price.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      if (homeBloc.isProductInCart(productDataModel)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Already in cart'),
                          ),
                        );
                      } else {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productDataModel));
                      }
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              if (homeBloc.isProductInCart(productDataModel)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Already in cart'),
                  ),
                );
              } else {
                homeBloc.add(HomeProductCartButtonClickedEvent(
                    clickedProduct: productDataModel));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255,139,195,74),
              foregroundColor: const Color.fromARGB(216, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 0.5,
                ),
              ),
              minimumSize: Size(4 * 24.0, 2 * 24.0), // Adjust size here
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
