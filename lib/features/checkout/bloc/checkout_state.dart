import 'package:equatable/equatable.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

// Initial state
class CheckoutInitial extends CheckoutState {}

// State for updating card type
class CheckoutCardTypeUpdated extends CheckoutState {
  final bool isVisa;

  const CheckoutCardTypeUpdated({required this.isVisa});

  @override
  List<Object?> get props => [isVisa];
}

// State for success
class CheckoutSuccessState extends CheckoutState {
  final String message;

  const CheckoutSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

// State for errors
class CheckoutErrorState extends CheckoutState {
  final String error;

  const CheckoutErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
