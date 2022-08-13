// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field

import 'package:equatable/equatable.dart';

// 用户信息数据模型
class UserViewModel extends Equatable {
  final String id;
  final int is_vip;
  final String avatar;
  final String openid;
  final String unionid;
  final String appleid;
  final String nickname;
  final String mobile;
  final String invitation_code;
  final String invited_code;
  final String register_channel;
  final String register_version;
  final String login_channel;
  final String login_version;
  final String system_type;
  final String device_info;
  final String status;
  final int user_type;
  final maturity_time;
  final createAt;
  final updateAt;
  final last_login_date;
  const UserViewModel({
    required this.id,
    required this.is_vip,
    required this.maturity_time,
    required this.avatar,
    required this.openid,
    required this.unionid,
    required this.appleid,
    required this.nickname,
    required this.mobile,
    required this.user_type,
    required this.invitation_code,
    required this.invited_code,
    required this.register_channel,
    required this.register_version,
    required this.login_channel,
    required this.login_version,
    required this.system_type,
    required this.device_info,
    required this.status,
    required this.createAt,
    required this.updateAt,
    required this.last_login_date,
  });

  @override
  List<Object> get props => [
        id,
        mobile,
        is_vip,
        maturity_time,
        nickname,
        avatar,
        openid,
        appleid,
        invitation_code,
        invited_code,
        register_channel,
        register_version,
        login_channel,
        system_type,
        device_info,
        status,
        createAt,
        updateAt,
        last_login_date,
      ];
}

// 用户信息数据模型
class UserUiModel extends Equatable {
  final String name;
  final int id;
  final String? icon;
  final String? lastName;
  final bool isH5;
  final bool isOnTap;
  final String? path;
  final Map<String, dynamic>? params;
  const UserUiModel(
      {required this.id,
      required this.name,
      required this.path,
      this.icon,
      this.lastName,
      this.isH5 = false,
      this.params,
      this.isOnTap = false});
  @override
  List<dynamic> get props =>
      [name, icon, lastName, isOnTap, isH5, path, params];
}
