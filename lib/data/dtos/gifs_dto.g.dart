// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifsDto _$GifsDtoFromJson(Map<String, dynamic> json) => GifsDto(
  results: (json['results'] as List<dynamic>)
      .map((e) => GifResultDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  next: json['next'] as String,
);

GifResultDto _$GifResultDtoFromJson(Map<String, dynamic> json) => GifResultDto(
  id: json['id'] as String,
  title: json['title'] as String,
  contentDescription: json['content_description'] as String,
  media_formats: (json['media_formats'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, MediaFormatDto.fromJson(e as Map<String, dynamic>)),
  ),
);

MediaFormatDto _$MediaFormatDtoFromJson(Map<String, dynamic> json) =>
    MediaFormatDto(
      url: json['url'] as String,
      dims: (json['dims'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      duration: (json['duration'] as num?)?.toDouble(),
    );
