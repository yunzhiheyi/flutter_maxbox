// 工具类
class tools {
  // 序列化GET参数
  static serialization(params) {
    String result = '';
    params.forEach((key, value) {
      String string = '';
      if (result.length > 0) {
        string = '&';
      }
      result = result + string + '${key}=${value}';
    });
    return result;
  }

  // 验证手机号
  static isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }
}
