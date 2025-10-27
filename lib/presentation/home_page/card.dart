part of 'home_page.dart';

typedef OnLikeCallBack = void Function(String title, bool isLiked)?;
class _Card extends StatefulWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;
  final OnLikeCallBack onLike;
  final VoidCallback? onTap;

  const _Card(this.text, {
    required this.icon,
    required this.descriptionText,
    this.imageUrl,
    this.onLike,
    this.onTap
  });
  factory _Card.fromData(CardData data,
      {OnLikeCallBack onLike, VoidCallback? onTap}) => _Card(
    data.text,
    icon: data.icon,
    descriptionText: data.descriptionText,
    imageUrl: data.imageUrl,
    onLike: onLike,
    onTap: onTap,
  );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 140),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amber, width: 2,),
          boxShadow: [
            BoxShadow(
              color: Colors.amberAccent,
              spreadRadius: 7,
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 120,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          widget.imageUrl ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___,) => const Placeholder(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Text(
                            'approved',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        widget.descriptionText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                    child: Icon(widget.icon),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 16,
                          bottom: 16
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() =>
                            isLiked = !isLiked
                          );
                          widget.onLike?.call(widget.text, isLiked);
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isLiked
                              ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            key: ValueKey<int>(0),
                          )
                              : const Icon(Icons.favorite_border_outlined, key: ValueKey<int>(1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}