import 'request.dart';

class Api {
  ///登录
  static login(Map<String, dynamic> data) {
    return Request.post(
      "/api/v1/app/login",
      params: data,
    );
  }

  ///发送验证码
  static getCode(Map<String, dynamic> data) {
    return Request.post(
      "/api/v1/app/generic/sendsms",
      params: data,
    );
  }

  ///获取内容
  static getContent(Map<String, dynamic> data) {
    return Request.get(
      "/api/v1/app/generic/getContent",
      params: data,
    );
  }

  // 获取版本号
  static upgradVersion(Map<String, dynamic> data) {
    return Request.get(
      "/api/v1/client/user/upgradVersion",
      params: data,
    );
  }
}
