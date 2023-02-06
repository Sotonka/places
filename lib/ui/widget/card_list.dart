import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widget/sight_card.dart';

class SliverCardList extends StatelessWidget {
  final Iterable<Sight> iterable;
  final CardType type;

  const SliverCardList({
    Key? key,
    required this.iterable,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final orientation = MediaQuery.of(context).orientation;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Column(
          children: [
            if (index == 0)
              orientation == Orientation.portrait
                  ? const SizedBox(height: 34)
                  : const SizedBox.shrink()
            else
              const SizedBox.shrink(),
            if (orientation == Orientation.portrait)
              SightCard(
                sight: iterable.elementAt(index),
                type: type,
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SightCard(
                  sight: iterable.elementAt(index),
                  type: type,
                ),
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
}
