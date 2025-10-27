import 'package:breadpolitech/presentation/details_page/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/card.dart';
part 'card.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget{
  const Body({super.key});

  @override
  Widget build(BuildContext context){
    final data = [
      CardData(
          text: 'Yapping',
          descriptionText: '',
          icon: Icons.mark_chat_unread_sharp,
          imageUrl:
          'https://media1.tenor.com/m/xXQF70Ptmb0AAAAC/limbus-company-limbus.gif'
      ),
      CardData(
          text: 'Wahoo!!',
          descriptionText: 'Hohoho',
          icon: Icons.headset,
          imageUrl:
          'https://media1.tenor.com/m/M_9Vr0JbimsAAAAC/wahoo-limbus-company.gif'
      ),
      CardData(
          text: 'Yummy',
          descriptionText: 'Tasty',
          icon: Icons.fastfood_rounded,
          imageUrl:
          'https://media1.tenor.com/m/AQa-sGBW6JYAAAAC/luffy-gordo-luffy-gordinho.gif'
      ),
      CardData(
          text: 'Monkey',
          descriptionText: 'Banana',
          icon: Icons.apple,
          imageUrl:
          'https://media1.tenor.com/m/qrDAnYdfLg4AAAAC/dk.gif'
      ),
      CardData(
          text: 'NoNoNo',
          descriptionText: 'WaitWaitWait',
          icon: Icons.not_interested,
          imageUrl:
          'https://media1.tenor.com/m/Ntxkcyv6TS0AAAAd/the-punisher-wait-wait-wait-no-no-no.gif'
      ),
      CardData(
          text: 'Absolute Cinema',
          descriptionText: '',
          icon: Icons.accessibility_new,
          imageUrl:
          'https://media1.tenor.com/m/9gyW2QldGvkAAAAC/me-atrapaste-es-cine.gif'
      )
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((data) => _Card.fromData(data,
            onLike: (String title, bool isLiked) =>
              _showSnackBar(context, title, isLiked),
            onTap: () => _navToDetails(context, data),
            ))
              .toList(),
        ),
      ),
    );
  }
}
void _showSnackBar(BuildContext context, String title, bool isLiked) {
  WidgetsBinding.instance.addPostFrameCallback((_){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'GIF $title ${isLiked ? 'liked!' : 'disliked ((' }',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.amberAccent,
        duration: const Duration(seconds: 1),
    ));
  });
}
void _navToDetails(BuildContext context, CardData data) {
  Navigator.push(context,
    CupertinoPageRoute(builder: (context) => DetailsPage(data)),
  );
}