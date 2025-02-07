// sign_up_state.dart
abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}

class SignUpFailure extends SignUpState {
  final String error;
  const SignUpFailure(this.error);
}
