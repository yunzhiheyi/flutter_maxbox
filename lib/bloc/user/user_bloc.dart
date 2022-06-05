// ignore_for_file:  unused_import, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:max_box/model/models.dart';
import 'package:max_box/utils/LocalStorage.dart';
import 'package:max_box/utils/api.dart';
import 'package:max_box/utils/tools.dart';
import 'package:stream_transform/stream_transform.dart';
// import 'package:max_box/views/login.dart';

part 'user_event.dart';
part 'user_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<getCode>(
      _onGetCodeFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<onCheckBox>(
      _onCheckBox,
      transformer: throttleDroppable(throttleDuration),
    );
    on<submitLogin>(
      _onLoginFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  // 选中
  Future<void> _onCheckBox(
    onCheckBox event,
    Emitter<UserState> emit,
  ) async {
    emit(
      state.copyWith(
        isCheck: !state.isCheck,
      ),
    );
  }

  // 获取 onGetCode
  Future<void> _onGetCodeFetched(
    getCode event,
    Emitter<UserState> emit,
  ) async {
    try {
      if (!tools.isChinaPhoneLegal(event.mobile)) {
        return EasyLoading.showToast("手机输入不正确");
      }
      await _fetchGetCode(event.mobile);
    } catch (_) {
      debugPrint('ERROR');
    }
  }

  // 登录 onFetched
  Future<void> _onLoginFetched(
    submitLogin event,
    Emitter<UserState> emit,
  ) async {
    try {
      if (!tools.isChinaPhoneLegal(event.mobile)) {
        return EasyLoading.showToast("手机输入不正确");
      }
      if (event.mobile.isEmpty) {
        return EasyLoading.showToast("手机号不能为空");
      }
      if (event.code.isEmpty) {
        return EasyLoading.showToast("验证码不能为空");
      }
      if (!state.isCheck) {
        return EasyLoading.showToast("请仔细阅读服务条款与隐私政策");
      }

      Map<String, dynamic> resData =
          await _fetchLogin(event.mobile, event.code);
      if (resData['code'] == 200) {
        emit(state.copyWith(
            status: LoginStatus.success,
            isCheck: false,
            access_token: resData['data']['access_token'],
            refresh_token: resData['data']['refresh_token']));
      }
    } catch (_) {
      debugPrint('LoginStatus ERROR----$_');
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  // 登录接口
  Future _fetchLogin(String mobile, String code) async {
    Map<String, dynamic> options = {
      "mobile": mobile,
      "code": code,
    };
    Map<String, dynamic> resData = await Api.login(options);
    if (resData['code'] == 200) {
      // // 保存 access_token  |  refresh_token  |  userInfo
      await LocalStorage.save(
          LocalStorage.accessTokenKey, resData['data']['access_token']);
      await LocalStorage.save(
          LocalStorage.accessTokenKey, resData['data']['refresh_token']);
      await LocalStorage.save(
          LocalStorage.userInfoKey, resData['data']['userInfo'].toString());
    }
    return resData;
  }

  // 获取短信请求接口
  Future _fetchGetCode(String? mobile) async {
    Map<String, dynamic> options = {
      "mobile": mobile,
      "smsType": 1,
    };
    Map<String, dynamic> resData = await Api.getCode(options);
    // print('____response_____$response');
    if (resData['code'] == 200) {
      EasyLoading.showToast("${resData['message']}");
      return resData;
    }
  }
}
