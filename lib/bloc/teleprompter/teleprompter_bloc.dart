// ignore_for_file: depend_on_referenced_packages, avoid_print, no_leading_underscores_for_local_identifiers
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:fengchao/model/models.dart';
import 'package:fengchao/utils/api.dart';

import 'package:stream_transform/stream_transform.dart';
part 'teleprompter_event.dart';
part 'teleprompter_state.dart';

const _postLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TeleprompterBloc extends Bloc<TeleprompterEvent, TeleprompterState> {
  // HomeContentBloc() : super(HomeContentInitial()) {
  //   on<HomeContentEvent>((event, emit) {
  //     // ignore: todo
  //   });
  // }

  TeleprompterBloc() : super(const TeleprompterState()) {
    on<TeleprompterFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetched(
    TeleprompterFetched event,
    Emitter<TeleprompterState> emit,
  ) async {
    // 当前页与总页数相等就不执行
    if (state.currentPage == state.totalPage && state.currentPage > 0) return;
    try {
      final homeList = await _fetchGetcontent(state.currentPage + 1);
      emit(
        state.copyWith(
          status: TeleprompterStatus.success,
          homeList: List.of(state.homeList)..addAll(homeList['listModel']),
          totalPage: homeList['totalPage'],
          currentPage: homeList['currentPage'],
        ),
      );
    } catch (_err) {
      debugPrint('___$_err');
      emit(state.copyWith(status: TeleprompterStatus.failure));
    }
  }

  // 请求接口
  Future _fetchGetcontent([int currentPage = 1]) async {
    Map<String, dynamic> options = {
      "pageSize": _postLimit,
      "current": currentPage,
    };
    Map<String, dynamic> resData = await Api.getContent(options);
    if (resData['code'] == 200) {
      final body = resData['data']['result'] as List;
      final List<HomeContentViewModel> listModel;
      if (body.isNotEmpty) {
        listModel = body.map((dynamic json) {
          return HomeContentViewModel(
              id: json['_id'],
              title: json['title'],
              content: json['content'],
              created_time: json['created_time']);
        }).toList();
      } else {
        listModel = [];
      }
      Map<String, dynamic> successData = {
        "listModel": listModel,
        "totalPage": resData['data']['totalPage'],
        "currentPage": resData['data']['page']
      };
      return successData;
    }
  }
}
