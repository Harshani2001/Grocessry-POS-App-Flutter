import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mpos/data/wishlist_items.dart';
import 'package:mpos/features/cart/bloc/cart_bloc.dart';
import 'package:mpos/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final CartBloc cartBloc;

  WishlistBloc({required this.cartBloc}) : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromCartEvent);
    on<WishlistCartButtonClickedEvent>(wishlistCartButtonClickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromCartEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistCartButtonClickedEvent(
      WishlistCartButtonClickedEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel); // Remove from wishlist
    emit(WishlistSuccessState(wishlistItems: wishlistItems));

    // Dispatch event to CartBloc
    cartBloc.add(CartAddToCartEvent(productDataModel: event.productDataModel));
  }
}
