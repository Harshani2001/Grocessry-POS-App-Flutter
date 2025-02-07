import 'package:flutter/material.dart';
import 'package:mpos/features/cart/bloc/cart_bloc.dart';
import 'package:mpos/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.productDataModel.price * quantity;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(206, 209, 209, 209)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 60, // Adjusted size for the image
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between image and text

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  widget.productDataModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Product Description
                Text(
                  widget.productDataModel.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Product Price
                const SizedBox(height: 5),
                Text(
                  "Rs. ${totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Increment and Decrement Buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 16),
                      onPressed: _decrementQuantity,
                      padding: const EdgeInsets.all(4),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 16),
                      onPressed: _incrementQuantity,
                      padding: const EdgeInsets.all(4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              IconButton(
                onPressed: () {
                  widget.cartBloc.add(CartRemoveFromCartEvent(
                    productDataModel: widget.productDataModel,
                  ));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                tooltip: 'Remove from cart',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
