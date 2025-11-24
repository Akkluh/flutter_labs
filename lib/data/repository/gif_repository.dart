// data/repository/gif_repository.dart
import 'package:breadpolitech/data/dtos/gifs_dto.dart';
import 'package:breadpolitech/data/mappers/gifs_mapper.dart';
import 'package:breadpolitech/data/repository/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/models/card.dart';

class GifRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
    ));

  static const String _baseUrl = 'https://tenor.googleapis.com/v2';
  static const String _apiKey = 'AIzaSyD2a76iLOwzh9PlwZtdipep1-34fm4-dmc';

  @override
  Future<List<CardData>> loadData({String q = 'cat'}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_baseUrl/search',
        queryParameters: {
          'key': _apiKey,
          'q': q.trim().isEmpty ? 'funny' : q.trim(),
          'limit': 20,
          'media_filter': 'gif',
          'contentfilter': 'off',
          'client_key': 'moaisbd31',
        },
      );

      final GifsDto dto = GifsDto.fromJson(response.data!);
      return dto.results.map((e) => e.toDomain()).toList();

    } on DioException catch (e) {
      print('Ошибка Tenor API: ${e.response?.statusCode}');
      print(e.response?.data);
      return [];
    } catch (e) {
      print('Неизвестная ошибка: $e');
      return [];
    }
  }
}