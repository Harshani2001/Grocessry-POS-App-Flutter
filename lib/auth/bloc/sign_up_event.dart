// sign_up_event.dart
abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpSubmitted extends SignUpEvent {
  final String phoneNumber;
  final String email;
  final String username;
  final String password;
  final bool rememberMe;

  const SignUpSubmitted({
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.password,
    required this.rememberMe,
  });
}
