import 'package:flutter/material.dart';
import 'package:mpos/features/home/models/home_product_data_model.dart';
import 'package:mpos/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });

  @override
  _WishlistTileWidgetState createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
  bool isInWishlist = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(206, 209, 209, 209)),
      ),
      child: Row(
        children: [
          // Image Display
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 10),

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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),

                // Product Description
                Text(
                  widget.productDataModel.description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),

                // Product Price
                Text(
                  "LKR ${widget.productDataModel.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Row(
            children: [
              // Remove from Wishlist Button
              IconButton(
                onPressed: () {
                  setState(() {
                    isInWishlist = !isInWishlist;
                  });
                  widget.wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                      productDataModel: widget.productDataModel));
                },
                icon: Icon(
                  Icons.favorite,
                  color: isInWishlist
                      ? const Color.fromARGB(255, 236, 52, 52)
                      : Colors.grey,
                ),
              ),
              const SizedBox(width: 5),

              // Add to Cart Button
              IconButton(
                onPressed: () {
                  setState(() {
                    isInWishlist = !isInWishlist;
                  });
                  widget.wishlistBloc.add(WishlistCartButtonClickedEvent(
                      productDataModel: widget.productDataModel));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
