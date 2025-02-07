import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpos/features/cart/bloc/cart_bloc.dart';
import 'package:mpos/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:mpos/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc cartBloc = WishlistBloc(cartBloc: CartBloc());
  @override
  void initState() {
    cartBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist  Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                        wishlistBloc: cartBloc,
                        productDataModel: successState.wishlistItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
