// 工具类
// ignore_for_file: prefer_interpolation_to_compose_strings, camel_case_types, unnecessary_new

class tools {
  // 序列化GET参数
  static serialization(params) {
    String result = '';
    params.forEach((key, value) {
      String string = '';
      if (result.isNotEmpty) {
        string = '&';
      }
      // ignore: unnecessary_brace_in_string_interps
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
