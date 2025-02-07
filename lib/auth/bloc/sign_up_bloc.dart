
// sign_up_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(const SignUpLoading());
      
      // Add your sign up logic here
      // Example: await authRepository.signUp(...)
      
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      
      emit(const SignUpSuccess());
    } catch (error) {
      emit(SignUpFailure(error.toString()));
    }
  }
}
