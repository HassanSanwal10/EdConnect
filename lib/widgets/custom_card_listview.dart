import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final List<String> items;

  const CardListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map(
          (item) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    item,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
