import 'package:equatable/equatable.dart';
import 'package:mpos/features/home/models/home_product_data_model.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

// Event for selecting card type
class CardTypeSelectedEvent extends CheckoutEvent {
  final bool isVisa;

  const CardTypeSelectedEvent(this.isVisa);

  @override
  List<Object?> get props => [isVisa];
}

// Event for submitting card details
class CardDetailsSubmittedEvent extends CheckoutEvent {
  final String name;
  final String cardNumber;
  final String expiry;
  final String cvv;

  const CardDetailsSubmittedEvent({
    required this.name,
    required this.cardNumber,
    required this.expiry,
    required this.cvv,
  });

  @override
  List<Object?> get props => [name, cardNumber, expiry, cvv];
}

class CartCheckoutButtonClickEvent extends CheckoutEvent {
  final ProductDataModel clickedProduct;
  CartCheckoutButtonClickEvent({
    required this.clickedProduct,
  });
}
