// data/repository/gif_repository.dart
import 'package:breadpolitech/data/dtos/gifs_dto.dart';
import 'package:breadpolitech/data/mappers/gifs_mapper.dart';
import 'package:breadpolitech/data/repository/api_interface.dart';
import 'package:breadpolitech/domain/models/home.dart';
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
  static const String _apiKey = '################################';

  @override
  Future<HomeData?> loadData({
    OnErrorCallback? onError,
    required String q,
    String? pos
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_baseUrl/search',
        queryParameters: {
          'key': _apiKey,
          'q': q.trim().isEmpty ? 'funny' : q.trim(),
          'limit': 20,
          'pos': pos,
          'media_filter': 'gif',
          'contentfilter': 'off',
          'client_key': 'moaisbd31',
        },
      );

      final GifsDto dto = GifsDto.fromJson(response.data!);
      return HomeData(
          data: dto.results.map((e) => e.toDomain()).toList(),
          nextPos: dto.next
      );

    } on DioException catch (e) {
      onError?.call(e.error?.toString());
      return null;
    }
  }
}
