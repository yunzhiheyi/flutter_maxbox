// ignore_for_file: non_constant_identifier_names

part of 'user_bloc.dart';

enum LoginStatus { initial, success, failure }
enum VerifiedStatus { initial, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = LoginStatus.initial,
    this.codeVerified = VerifiedStatus.initial,
    this.isCheck = false,
    this.access_token = '',
    this.refresh_token = '',
  });
  final LoginStatus status;
  final VerifiedStatus codeVerified;
  final bool isCheck;
  final String access_token;
  final String refresh_token;
  @override
  String toString() {
    return '''UserState { status:$status,codeVerified:$codeVerified, isCheck: $isCheck,access_token:$access_token, refresh_token:$refresh_token}''';
  }

  @override
  List<Object> get props => [isCheck, access_token, refresh_token];
  UserState copyWith({
    LoginStatus? status,
    VerifiedStatus? codeVerified,
    bool? isCheck,
    String? access_token,
    String? refresh_token,
  }) {
    return UserState(
      status: status ?? this.status,
      codeVerified: codeVerified ?? this.codeVerified,
      isCheck: isCheck ?? this.isCheck,
      access_token: access_token ?? this.access_token,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }
}

class UserInitial extends UserState {}
