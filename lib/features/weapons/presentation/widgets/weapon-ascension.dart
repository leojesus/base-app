import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/weapons/model/weapon.model.dart';
import 'package:genshin_builder/features/weapons/providers/weapon.provider.dart';

class WeaponAscensionPage extends ConsumerWidget {
  final String weaponName;
  const WeaponAscensionPage(this.weaponName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Weapon? weapon = ref.read(weaponProvider.notifier).findByName(weaponName);
    if (weapon == null) {
      return Text("Weapon not found");
    }

    return Scaffold(
      body: Column(
        children: [Text("weapon WeaponAscensionPage page!"), Text(weapon.name)],
      ),
    );
  }
}
