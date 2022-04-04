part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent{
  final Map<String, dynamic> json;
  const Login({required this.json,});

  @override
  List<Object?> get props => [];
}