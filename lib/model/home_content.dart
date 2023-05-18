// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class HomeContentViewModel extends Equatable {
  const HomeContentViewModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.created_time});
  final String id;
  final String title;
  final String content;
  final String created_time;
  @override
  List<Object> get props => [id, title, content, created_time];
}
