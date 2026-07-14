import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/utils/extensions/stream_extensions.dart';
import 'package:my_app/core/utils/helpers/dp_disposable.dart';
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart';
import 'package:my_app/core/utils/validators/validators.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/auth/login/bloc/login_event.dart';
import 'package:my_app/pages/auth/login/bloc/login_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with DPDisposable {
  final formKey = GlobalKey<FormState>();
  final _validatorHelp = getIt<AppValidators>();
  final _logger = getIt<LoggerHelper>();
  final _loginStream = PublishSubject<LoginState>();
  final successStream = BehaviorSubject<bool>.seeded(false);

  LoginBloc() : super(LoginState.initial()) {
    _loginStream
        .doOnData((state) {
          _logger.debug("state: ${state.email} ${state.password}");
        })
        .asyncMap((convert) => {})
        .doOnData((onData) => {})
        .doOnError((error, stackTrace) {
          _logger.error("error: $error");
        })
        .map((state) => true)
        .bindTo(successStream)
        .canceledBy(this);

    // App Started
    on<AppStarted>((event, emit) {
      // handle logic app started
    });

    // Login
    on<LoginEvent>((event, emit) {
      // handle logic login
    });

    // Email
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
      add(LoginEmailValidation(event.email));
    });

    // Password
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
      add(LoginPasswordValidation(event.password));
    });

    // Eye
    on<LoginEyeChanged>((event, emit) {
      emit(state.copyWith(isObscure: event.isObscure));
    });

    // Submit
    on<LoginSubmitted>((event, emit) {
      _loginStream.add(state);
    });

    // Validations
    on<LoginEmailValidation>((event, emit) {
      final error = _validatorHelp.validateEmail(event.email, 'Email');
      emit(state.copyWith(emailError: error));
    });

    on<LoginPasswordValidation>((event, emit) {
      final error = _validatorHelp.validatePassword(event.password, 'Password');
      emit(state.copyWith(passwordError: error));
    });

    // Validation Submit
    on<LoginValidationSubmit>((event, emit) {
      if (state.emailError == null && state.passwordError == null) {
        add(LoginSubmitted(state.email, state.password));
      }
    });
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    _loginStream.close();
    successStream.close();
    return super.close();
  }
}
