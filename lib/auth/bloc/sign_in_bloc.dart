import 'package:bloc/bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    // Handle EmailChanged event
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    // Handle PasswordChanged event
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    // Handle SignInSubmitted event
    on<SignInSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));

      // Simulate a delay for authentication process
      await Future.delayed(const Duration(seconds: 1));


      if (state.email == 'biz@gmail.com' && state.password == '12345') {
        emit(state.copyWith(
        isSubmitting: false,
        isAuthenticated: true, // Authentication successful
        errorMessage: null,     // Clear error message
     ));
     print('Authenticated: true'); 
      // Debugging line
     } else {

         emit(state.copyWith(
         isSubmitting: false,
         errorMessage: 'Invalid email or password',
         isAuthenticated: false,  // Authentication failed
      ));
     print('Authenticated: false');  // Debugging line
    }


    });
  }
}



