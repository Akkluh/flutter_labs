import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: const MyHomePage(title: 'МОАИСбд-31 Ключников Артем'),
    );
  }
}

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
      body: const MyWidget(),
    );
  }
}
class _CardData{
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;
  _CardData({required this.text, required this.descriptionText, required this.icon, this.imageUrl,});
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context){
    final data = [
      _CardData(
          text: 'Yapping',
          descriptionText: '',
          icon: Icons.mark_chat_unread_sharp,
          imageUrl:
          'https://media1.tenor.com/m/xXQF70Ptmb0AAAAC/limbus-company-limbus.gif'
      ),
      _CardData(
          text: 'Ohohoho',
          descriptionText: 'Hohoho',
          icon: Icons.headset,
          imageUrl:
          'https://media1.tenor.com/m/sAxlimi9r4gAAAAC/limbus-company-don-quixote.gif'
      ),
      _CardData(
          text: 'Yummy',
          descriptionText: 'Tasty',
          icon: Icons.fastfood_rounded,
          imageUrl:
          'https://media1.tenor.com/m/AQa-sGBW6JYAAAAC/luffy-gordo-luffy-gordinho.gif'
      ),
      _CardData(
          text: 'Monkey',
          descriptionText: 'Banana',
          icon: Icons.apple,
          imageUrl:
          'https://media1.tenor.com/m/qrDAnYdfLg4AAAAC/dk.gif'
      ),
      _CardData(
          text: 'NoNoNo',
          descriptionText: 'WaitWaitWait',
          icon: Icons.not_interested,
          imageUrl:
          'https://media1.tenor.com/m/Ntxkcyv6TS0AAAAd/the-punisher-wait-wait-wait-no-no-no.gif'
      ),
      _CardData(
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
          children: data.map((e) => _Card.fromData(e)).toList(),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;
  const _Card(this.text, {required this.icon, required this.descriptionText, this.imageUrl,});
  factory _Card.fromData(_CardData data) => _Card(
    data.text, icon: data.icon, descriptionText: data.descriptionText, imageUrl: data.imageUrl,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black, width: 2,),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8,
            offset: const Offset(0, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___,) => const Placeholder(),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    descriptionText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
