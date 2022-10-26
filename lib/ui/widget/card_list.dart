import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widget/sight_card.dart';

class CardList extends StatelessWidget {
  final Iterable<Sight> iterable;
  final CardType type;

  const CardList({
    Key? key,
    required this.iterable,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: iterable.length,
        itemBuilder: (context, index) => SightCard(
          sight: iterable.elementAt(index),
          type: type,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
      );
}
