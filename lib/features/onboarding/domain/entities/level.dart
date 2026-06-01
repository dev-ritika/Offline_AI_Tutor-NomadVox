import 'package:equatable/equatable.dart';

class Level extends Equatable {
  final String code;
  final String title;
  final String subTitle;

  const Level({
    required this.title,
    required this.subTitle,
    required this.code,
  });

  @override
  List<Object> get props => [code, title, subTitle];
}
