part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class getCode extends UserEvent {
  final String mobile;
  const getCode({required this.mobile});
}

class onCheckBox extends UserEvent {
  final bool isCheck;
  const onCheckBox({required this.isCheck});
}

class submitLogin extends UserEvent {
  final String mobile;
  final String code;
  const submitLogin({required this.mobile, required this.code});
}
