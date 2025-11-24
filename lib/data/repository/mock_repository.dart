import 'package:breadpolitech/data/repository/api_interface.dart';
import 'package:flutter/material.dart';

import '../../domain/models/card.dart';

class MockRepository extends ApiInterface{
  @override
  Future<List<CardData>?> loadData() async {
    return[
      CardData(
          'Yapping',
          descriptionText: '',
          icon: Icons.mark_chat_unread_sharp,
          imageUrl:
          'https://media1.tenor.com/m/xXQF70Ptmb0AAAAC/limbus-company-limbus.gif'
      ),
      CardData(
          'Wahoo!!',
          descriptionText: 'Hohoho',
          icon: Icons.headset,
          imageUrl:
          'https://media1.tenor.com/m/M_9Vr0JbimsAAAAC/wahoo-limbus-company.gif'
      ),
      CardData(
          'Nice',
          descriptionText: '',
          icon: Icons.smart_display_rounded,
          imageUrl:
          'https://media1.tenor.com/m/5lLcKZgmIhgAAAAC/american-psycho-patrick-bateman.gif'
      ),
      CardData(
          'Monkey',
          descriptionText: 'Banana',
          icon: Icons.apple,
          imageUrl:
          'https://media1.tenor.com/m/qrDAnYdfLg4AAAAC/dk.gif'
      ),
      CardData(
          'NoNoNo',
          descriptionText: 'WaitWaitWait',
          icon: Icons.not_interested,
          imageUrl:
          'https://media1.tenor.com/m/Ntxkcyv6TS0AAAAd/the-punisher-wait-wait-wait-no-no-no.gif'
      ),
      CardData(
          'Absolute Cinema',
          descriptionText: '',
          icon: Icons.accessibility_new,
          imageUrl:
          'https://media1.tenor.com/m/9gyW2QldGvkAAAAC/me-atrapaste-es-cine.gif'
      )
    ];
  }
}