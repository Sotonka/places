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
    final orientation = MediaQuery.of(context).orientation;

    return SliverPadding(
      padding: orientation == Orientation.portrait
          ? const EdgeInsets.only(top: 34, bottom: 16)
          : const EdgeInsets.only(bottom: 16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
            children: [
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
            ],
          ),
          childCount: iterable.length,
        ),
      ),
    );
  }
}
