import 'package:breadpolitech/domain/models/card.dart';
import 'package:breadpolitech/domain/models/home.dart';

typedef OnErrorCallback = void Function(String? error);

abstract class ApiInterface {
  Future<HomeData?> loadData({required String q, String? pos, OnErrorCallback? onError});
}
