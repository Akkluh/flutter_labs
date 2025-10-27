import 'package:flutter/material.dart';

class CardData{
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;
  CardData({required this.text,
    required this.descriptionText,
    required this.icon,
    this.imageUrl,});
}