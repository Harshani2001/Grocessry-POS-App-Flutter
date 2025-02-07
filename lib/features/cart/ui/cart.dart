import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/features/cart/bloc/cart_bloc.dart';
import 'package:mpos/features/cart/ui/cart_tile_widget.dart';
import 'package:mpos/features/checkout/bloc/checkout_bloc.dart';
import 'package:mpos/features/checkout/bloc/checkout_event.dart';
import 'package:mpos/features/checkout/bloc/checkout_state.dart';
import 'package:mpos/features/checkout/ui/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc(); // Bloc for cart management
  final CheckoutBloc checkoutBloc = CheckoutBloc(); // Bloc for checkout

  @override
  void initState() {
    cartBloc.add(CartInitialEvent()); // Initialize the cart
    super.initState();
  }

  @override
  void dispose() {
    cartBloc.close(); // Dispose of cartBloc when widget is removed
    checkoutBloc.close(); // Dispose of checkoutBloc when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Listen to CheckoutBloc for navigation
        BlocListener<CheckoutBloc, CheckoutState>(
          bloc: checkoutBloc,
          listener: (context, state) {
            if (state is CheckoutSuccessState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Checkout()),
              );
            } else if (state is CheckoutErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Items'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
            if (state is CartActionState) {
              // Handle specific cart action states if needed
            }
          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            if (state is CartSuccessState) {
              final successState = state;

              // Calculate subtotal
              double subtotal = successState.cartItems.fold(
                0,
                (total, item) => total + item.price,
              );

              return Column(
                children: [
                  // Cart items list
                  Expanded(
                    child: ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                          cartBloc: cartBloc,
                          productDataModel: successState.cartItems[index],
                        );
                      },
                    ),
                  ),

                  // Subtotal and Checkout Section
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    color: Colors.green,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Subtotal Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rs. ${subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Checkout Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Dispatch checkout event
                            if (successState.cartItems.isNotEmpty) {
                              checkoutBloc.add(CartCheckoutButtonClickEvent(
                                clickedProduct: successState.cartItems.first,
                              ));
                            } else {
                              // Handle empty cart scenario
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Cart is empty!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'CHECK OUT NOW',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // Fallback UI for other states
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
