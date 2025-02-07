class SignInState {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isAuthenticated;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isAuthenticated,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage,
    );
  }
}













/*import 'package:equatable/equatable.dart';


class SignInState {
  final bool isSubmitting;
  final bool isAuthenticated;
  final String email;
  final String password;
  final String? errorMessage;

  const SignInState({
    this.isSubmitting = false,
    this.isAuthenticated = false, // Default value for isAuthenticated
    this.email = '',
    this.password = '',
    this.errorMessage,
  });

  SignInState copyWith({
    bool? isSubmitting,
    bool? isAuthenticated,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return SignInState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated, // Handle isAuthenticated
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
*/