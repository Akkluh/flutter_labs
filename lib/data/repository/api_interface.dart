import 'package:breadpolitech/domain/models/card.dart';

abstract class ApiInterface {
  Future<List<CardData>?> loadData();
}