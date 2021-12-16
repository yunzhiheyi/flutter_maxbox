import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:max_box/model/models.dart';
import 'package:max_box/utils/api.dart';

import 'package:stream_transform/stream_transform.dart';
part 'home_content_event.dart';
part 'home_content_state.dart';

const _postLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeContentBloc extends Bloc<HomeContentEvent, HomeContentState> {
  // HomeContentBloc() : super(HomeContentInitial()) {
  //   on<HomeContentEvent>((event, emit) {
  //     // ignore: todo
  //   });
  // }

  HomeContentBloc() : super(const HomeContentState()) {
    on<HomeContentFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetched(
    HomeContentFetched event,
    Emitter<HomeContentState> emit,
  ) async {
    // 当前页与总页数相等就不执行
    if (state.currentPage == state.totalPage && state.currentPage > 0) return;
    try {
      final homeList = await _fetchGetcontent(state.currentPage + 1);
      emit(
        state.copyWith(
          status: HomeContenStatus.success,
          homeList: List.of(state.homeList)..addAll(homeList['listModel']),
          totalPage: homeList['totalPage'],
          currentPage: homeList['currentPage'],
        ),
      );
    } catch (_) {
      print('failure2');
      emit(state.copyWith(status: HomeContenStatus.failure));
    }
  }

  // 请求接口
  Future _fetchGetcontent([int currentPage = 1]) async {
    Map<String, dynamic> options = {
      "pageSize": _postLimit,
      "current": currentPage,
    };
    Map<String, dynamic> resData = await Api.getContent(options);
    // Map resData = Map<String, dynamic>.from(response.data);
    // var data = jsonDecode(response.toString());
    // print('____response_____$response');
    if (resData['code'] == 200) {
      final body = resData['data']['list'] as List;
      final List<HomeContentViewModel> listModel = body.map((dynamic json) {
        return HomeContentViewModel(
            id: json['id'] as String,
            title: json['title'] as String,
            content: json['content'] as String,
            create_time: json['create_time'] as String);
      }).toList();
      Map<String, dynamic> successData = {
        "listModel": listModel,
        "totalPage": resData['data']['totalPage'],
        "currentPage": resData['data']['page']
      };
      return successData;
    }
  }
}
