part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}

class CartAddToCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartAddToCartEvent({
    required this.productDataModel,
  });
}

class CartCheckoutButtonNavigateEvent extends CartEvent {}
