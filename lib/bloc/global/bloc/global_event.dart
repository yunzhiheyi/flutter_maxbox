// ignore_for_file: camel_case_types

part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class getGlobalData extends GlobalEvent {
  final double winWidth;
  final double winHeight;
  final double winTop;
  final double winBottom;
  const getGlobalData(
      {required this.winWidth,
      required this.winHeight,
      required this.winTop,
      required this.winBottom});
}
