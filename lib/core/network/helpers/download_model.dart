import 'package:dio/dio.dart';

class DownloadModel {
  final Response? response;
  final int download;

  DownloadModel({this.response, required this.download});
}
