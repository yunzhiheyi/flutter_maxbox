// ignore_for_file: camel_case_types

part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class getGlobalDataActiveText extends GlobalEvent {
  final bool activeText;
  const getGlobalDataActiveText({
    required this.activeText,
  });
}
