import 'package:equatable/equatable.dart';

abstract class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object> get props => [];
}

class LanguagesScreenLoads extends LanguagesEvent {}
