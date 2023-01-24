import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/weapons/model/weapon.model.dart';
import 'package:genshin_builder/features/weapons/providers/weapon.provider.dart';

class WeaponInfoPage extends ConsumerWidget {
  final String weaponName;
  const WeaponInfoPage(this.weaponName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Weapon? weapon = ref.read(weaponProvider.notifier).findByName(weaponName);
    if (weapon == null) {
      return Text("Weapon not found");
    }

    return Scaffold(
      body: Row(
        children: [
          Image.asset(
            weapon.imagePath,
            width: 100,
          ),
          Text(weapon.name)
        ],
      ),
    );
  }
}
