import 'package:equatable/equatable.dart';

class HomeContentViewModel extends Equatable {
  const HomeContentViewModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.create_time});
  final String id;
  final String title;
  final String content;
  final String create_time;
  @override
  List<Object> get props => [id, title, content, create_time];
}
