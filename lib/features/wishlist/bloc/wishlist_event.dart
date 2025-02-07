part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistRemoveFromWishlistEvent({
    required this.productDataModel,
  });
}

//class WishlistCartButtonClickedEvent extends WishlistEvent {
//final ProductDataModel productDataModel;
//WishlistCartButtonClickedEvent({
//required this.productDataModel,
//});
//}

class WishlistCartButtonClickedEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistCartButtonClickedEvent({
    required this.productDataModel,
  });
}
