// data/dtos/gifs_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'gifs_dto.g.dart';

@JsonSerializable(createToJson: false)
class GifsDto {
  final List<GifResultDto> results;
  final String next;

  const GifsDto({
    required this.results,
    required this.next,
  });

  factory GifsDto.fromJson(Map<String, dynamic> json) => _$GifsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class GifResultDto {
  final String id;
  final String title;
  @JsonKey(name: 'content_description')
  final String contentDescription;
  final Map<String, MediaFormatDto> media_formats;

  const GifResultDto({
    required this.id,
    required this.title,
    required this.contentDescription,
    required this.media_formats,
  });

  factory GifResultDto.fromJson(Map<String, dynamic> json) => _$GifResultDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class MediaFormatDto {
  final String url;
  final List<int> dims;
  final double? duration;

  const MediaFormatDto({
    required this.url,
    required this.dims,
    this.duration,
  });

  factory MediaFormatDto.fromJson(Map<String, dynamic> json) => _$MediaFormatDtoFromJson(json);
}