import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:genshin_builder/core/router/router.gr.dart';
import 'package:genshin_builder/features/chars/model/char_model.dart';

class CharTile extends StatelessWidget {
  final Char char;

  const CharTile(this.char, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => context.router.push(
              CharDetailRoute(
                charName: char.name,
              ),
            ),
            leading: Image.asset(
              "assets/images/chars/Alhaitham.png",
              width: 70,
            ),
            title: Text(
              char.name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            trailing: Image.asset(
              "assets/images/elements/dendro.png",
              width: 50,
              height: 50,
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
