// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class HomeContentViewModel extends Equatable {
  const HomeContentViewModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.createAt});
  final String id;
  final String title;
  final String content;
  final String createAt;
  @override
  List<Object> get props => [id, title, content, createAt];
}
