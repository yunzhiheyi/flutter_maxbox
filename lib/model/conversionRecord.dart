// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ConversionRecordModel extends Equatable {
  const ConversionRecordModel(
      {required this.id,
      required this.title,
      required this.state,
      required this.createAt});
  final String id;
  final String title;
  final String state;
  final String createAt;
  @override
  List<Object> get props => [id, title, state, createAt];
}
