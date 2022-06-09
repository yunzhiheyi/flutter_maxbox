// ignore_for_file: unnecessary_brace_in_string_interps
part of 'global_bloc.dart';

class GlobalState extends Equatable {
  const GlobalState({
    this.activeText = false,
  });
  final bool activeText;
  GlobalState copyWith({
    bool? activeText,
  }) {
    return GlobalState(
      activeText: activeText ?? this.activeText,
    );
  }

  @override
  String toString() {
    return '''GlobalState { activeText: $activeText} }''';
  }

  @override
  List<Object> get props => [activeText];
}

class GlobalInitial extends GlobalState {}
