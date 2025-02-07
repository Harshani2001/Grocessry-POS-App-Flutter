import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mpos/data/cart_items.dart';

// Events
import 'checkout_event.dart';
// States
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    // Event handler for selecting card type
    on<CardTypeSelectedEvent>((event, emit) {
      emit(CheckoutCardTypeUpdated(isVisa: event.isVisa));
    });

    // Event handler for checkout button click
    on<CartCheckoutButtonClickEvent>((event, emit) {
      print('Checkout Clicked');
      cartItems
          .add(event.clickedProduct); // Assuming `cartItems` is a global list.
      emit(CheckoutSuccessState('Product added to cart!'));
    });

    // Event handler for card details submission
    on<CardDetailsSubmittedEvent>((event, emit) {
      if (event.name.isEmpty ||
          event.cardNumber.isEmpty ||
          event.expiry.isEmpty ||
          event.cvv.isEmpty) {
        emit(CheckoutErrorState('All fields are required.'));
        return;
      }

      if (event.cardNumber.length != 16) {
        emit(CheckoutErrorState('Card number must be 16 digits.'));
        return;
      }

      if (event.cvv.length != 3) {
        emit(CheckoutErrorState('CVV must be 3 digits.'));
        return;
      }

      // On successful validation
      emit(CheckoutSuccessState('Card added successfully!'));
    });
  }
}
