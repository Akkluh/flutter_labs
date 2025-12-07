// data/mappers/gifs_mapper.dart
import 'package:breadpolitech/data/dtos/gifs_dto.dart';
import 'package:breadpolitech/domain/models/card.dart';
import 'package:breadpolitech/domain/models/home.dart';
import 'package:flutter/material.dart';

extension GifResultDtoX on GifResultDto {
  CardData toDomain() {
    final gifUrl = media_formats['gif']?.url ?? media_formats['nanogif']?.url;

    String titleText = title.trim();
    if (titleText.isEmpty || titleText == 'null') {
      titleText = 'Funny GIF';
    }

    String descriptionText = contentDescription.trim();
    if (descriptionText.isEmpty || descriptionText == 'null') {
      descriptionText = 'Нет описания';
    }

    return CardData(
      titleText,
      descriptionText: descriptionText,
      imageUrl: gifUrl,
      icon: Icons.gif_box_outlined,
    );
  }
}