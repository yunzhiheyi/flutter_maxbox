part of 'teleprompter_bloc.dart';

abstract class TeleprompterEvent extends Equatable {
  const TeleprompterEvent();

  @override
  List<Object> get props => [];
}

class TeleprompterFetched extends TeleprompterEvent {}
