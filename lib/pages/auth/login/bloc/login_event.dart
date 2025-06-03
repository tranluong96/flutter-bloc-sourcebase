import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends LoginEvent {}

// event enter email
class LoginEmailChanged extends LoginEvent {
  final String email;
  const LoginEmailChanged(this.email);
}

// event validation email
class LoginEmailValidation extends LoginEvent {
  final String email;
  const LoginEmailValidation(this.email);
}

// event enter password
class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);
}

// validation password
class LoginPasswordValidation extends LoginEvent {
  final String password;
  const LoginPasswordValidation(this.password);
}

// check validation submit
class LoginValidationSubmit extends LoginEvent {
  const LoginValidationSubmit();
}

// event submit login
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  const LoginSubmitted(this.email, this.password);
}

// event change eye
class LoginEyeChanged extends LoginEvent {
  final bool isObscure;
  const LoginEyeChanged(this.isObscure);
}