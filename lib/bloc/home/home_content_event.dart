part of 'home_content_bloc.dart';

abstract class HomeContentEvent extends Equatable {
  const HomeContentEvent();

  @override
  List<Object> get props => [];
}

class HomeContentFetched extends HomeContentEvent {}
