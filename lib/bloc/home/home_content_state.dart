part of 'home_content_bloc.dart';

enum HomeContenStatus { initial, success, failure }

class HomeContentState extends Equatable {
  const HomeContentState(
      {this.status = HomeContenStatus.initial,
      this.homeList = const <HomeContentViewModel>[],
      this.totalPage = 0,
      this.currentPage = 0});
  final HomeContenStatus status;
  final List<HomeContentViewModel> homeList;
  final int totalPage;
  final int currentPage;

  HomeContentState copyWith(
      {HomeContenStatus? status,
      List<HomeContentViewModel>? homeList,
      int? totalPage,
      int? currentPage}) {
    return HomeContentState(
        status: status ?? this.status,
        homeList: homeList ?? this.homeList,
        totalPage: totalPage ?? this.totalPage,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  String toString() {
    return '''HomeContentState { status: $status, homeList: ${homeList.length},totalPage: ${totalPage},currentPage: ${currentPage} }''';
  }

  @override
  List<Object> get props => [status, homeList, totalPage, currentPage];
}

class HomeContentInitial extends HomeContentState {}
