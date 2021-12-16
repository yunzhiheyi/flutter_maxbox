import 'package:equatable/equatable.dart';

class UserViewModel extends Equatable {
  final String id;
  final String username;
  final String mobile;
  final int is_vip;
  final maturity_time;
  final String avatar;
  final String open_id;
  final String apple_id;
  final String invitation_code;
  final String invited_code;
  final String register_channel;
  final String register_version;
  final String login_channel;
  final String login_version;
  final String sys_type;
  final String device_info;
  final String user_status;
  final create_time;
  final update_time;
  final last_login_date;
  const UserViewModel({
    required this.id,
    required this.username,
    required this.mobile,
    required this.is_vip,
    required this.maturity_time,
    required this.avatar,
    required this.open_id,
    required this.apple_id,
    required this.invitation_code,
    required this.invited_code,
    required this.register_channel,
    required this.register_version,
    required this.login_channel,
    required this.login_version,
    required this.sys_type,
    required this.device_info,
    required this.user_status,
    required this.create_time,
    required this.update_time,
    required this.last_login_date,
  });

  @override
  List<Object> get props => [
        id,
        username,
        mobile,
        is_vip,
        maturity_time,
        avatar,
        open_id,
        apple_id,
        invitation_code,
        invited_code,
        register_channel,
        register_version,
        login_channel,
        sys_type,
        device_info,
        user_status,
        create_time,
        update_time,
        last_login_date,
      ];
}
