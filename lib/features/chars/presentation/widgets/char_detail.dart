import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/model/element_enum.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';
import 'package:genshin_builder/features/chars/model/char_model.dart';
import 'package:genshin_builder/features/chars/providers/char.provider.dart';

class CharDetail extends ConsumerWidget {
  final String charName;
  const CharDetail(this.charName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Char? char = ref.read(charProvider.notifier).findByName(charName);
    if (char == null) return const Text("No char");

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  char.imagePath,
                ),
                Row(
                  children: [
                    Text(
                      char.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        char.element.imagePath,
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        char.weaponType.imagePath,
                        color: Theme.of(context).colorScheme.primary,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(char.description),
                ),
              ],
            )),
      ),
    );
  }
}
