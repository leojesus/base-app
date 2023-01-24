import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/router/router.gr.dart';
import 'package:genshin_builder/features/weapons/model/weapon.model.dart';

class WeaponTile extends ConsumerWidget {
  final Weapon weapon;
  const WeaponTile(this.weapon, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        onTap: () {
          context.router.push(
            WeaponDetailRouter(
              weaponName: weapon.name,
            ),
          );
        },
        leading: Image.asset(
          weapon.imagePath,
          width: 70,
        ),
        title: Text(weapon.name),
      ),
    );
  }
}
