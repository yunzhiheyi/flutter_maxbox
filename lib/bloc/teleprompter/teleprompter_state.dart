// ignore_for_file: unnecessary_brace_in_string_interps

part of 'teleprompter_bloc.dart';

enum TeleprompterStatus { initial, success, failure }

class TeleprompterState extends Equatable {
  const TeleprompterState(
      {this.status = TeleprompterStatus.initial,
      this.homeList = const <HomeContentViewModel>[],
      this.totalPage = 0,
      this.currentPage = 0});
  final TeleprompterStatus status;
  final List<HomeContentViewModel> homeList;
  final int totalPage;
  final int currentPage;

  TeleprompterState copyWith(
      {TeleprompterStatus? status,
      List<HomeContentViewModel>? homeList,
      int? totalPage,
      int? currentPage}) {
    return TeleprompterState(
        status: status ?? this.status,
        homeList: homeList ?? this.homeList,
        totalPage: totalPage ?? this.totalPage,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  String toString() {
    return '''TeleprompterState { status: $status, homeList: ${homeList.length},totalPage: ${totalPage},currentPage: ${currentPage} }''';
  }

  @override
  List<Object> get props => [status, homeList, totalPage, currentPage];
}

class TeleprompterInitial extends TeleprompterState {}
