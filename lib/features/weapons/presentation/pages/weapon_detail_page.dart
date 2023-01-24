import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/router/router.gr.dart';
import 'package:genshin_builder/features/weapons/model/weapon.model.dart';
import 'package:genshin_builder/features/weapons/providers/weapon.provider.dart';

class WeaponDetailPage extends ConsumerWidget {
  final String weaponName;
  const WeaponDetailPage(this.weaponName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Weapon? weapon = ref.read(weaponProvider.notifier).findByName(weaponName);

    if (weapon == null) {
      return Text("Weapon not found");
    }

    return AutoTabsScaffold(
      animationDuration: const Duration(microseconds: 0), // This  solved my flashing issue
      routes: [WeaponInfoRoute(weaponName: weaponName), WeaponAscensionRoute(weaponName: weaponName)],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                size: 30,
              ),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.upgrade,
                size: 30,
              ),
              label: 'Asc',
            ),
          ],
        );
      },
    );
  }
}
