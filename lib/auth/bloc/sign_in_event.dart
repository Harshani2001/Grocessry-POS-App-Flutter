//part of 'sign_in_bloc.dart';


abstract class SignInEvent {}

class EmailChanged extends SignInEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignInEvent {
  final String password;
  PasswordChanged(this.password);
}

class SignInSubmitted extends SignInEvent {}



//import 'package:equatable/equatable.dart';

/*abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignInEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignInSubmitted extends SignInEvent {}
*/
