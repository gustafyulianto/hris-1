import 'dart:async';

import 'package:hris/bloc/auth_bloc/auth.dart';
import 'package:hris/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  AuthenticationBloc _authenticationBloc;

  LoginBloc({
    UserRepository userRepository,
    AuthenticationBloc authenticationBloc,
  })  : _userRepository = userRepository , _authenticationBloc = authenticationBloc, super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await _userRepository.login(
          event.email,
          event.password,
        );
        _authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
