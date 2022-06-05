// ignore_for_file: unnecessary_brace_in_string_interps
part of 'global_bloc.dart';

class GlobalState extends Equatable {
  const GlobalState(
      {this.windowWidth = 0,
      this.windowHeight = 0,
      this.windowTop = 0,
      this.windowBottom = 0});
  final double windowWidth;
  final double windowHeight;
  final double windowTop;
  final double windowBottom;
  GlobalState copyWith(
      {double? windowWidth,
      double? windowHeight,
      double? windowTop,
      double? windowBottom}) {
    return GlobalState(
        windowWidth: windowWidth ?? this.windowWidth,
        windowHeight: windowHeight ?? this.windowHeight,
        windowTop: windowTop ?? this.windowTop,
        windowBottom: windowBottom ?? this.windowBottom);
  }

  @override
  String toString() {
    return '''GlobalState { windowWidth: $windowWidth,windowHeight: $windowHeight,windowTop:$windowTop,windowBottom:$windowBottom} }''';
  }

  @override
  List<Object> get props =>
      [windowWidth, windowHeight, windowTop, windowBottom];
}

class GlobalInitial extends GlobalState {}
