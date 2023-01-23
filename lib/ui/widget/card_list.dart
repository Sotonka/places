import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widget/sight_card.dart';

class CardList extends StatelessWidget {
  /// принимает список мест [iterable] и [type] - тип карточки
  /// (list, wishlist, visited) - влияет на отображение интерфейса -
  /// возможных действий с карточкой
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

class SliverCardList extends StatelessWidget {
  final Iterable<Sight> iterable;
  final CardType type;

  const SliverCardList({
    Key? key,
    required this.iterable,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
            children: [
              if (index == 0)
                const SizedBox(height: 34)
              else
                const SizedBox.shrink(),
              SightCard(
                sight: iterable.elementAt(index),
                type: type,
              ),
              if (index != iterable.length)
                const SizedBox(height: 16)
              else
                const SizedBox.shrink(),
            ],
          ),
          childCount: iterable.length,
        ),
      );
}
