import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/router/router.gr.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      animationDuration: const Duration(microseconds: 0), // This  solved my flashing issue
      appBarBuilder: (_, tabsRouter) => AppBar(
        title: const Text('Genshin Builder'),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      routes: const [CharRouter(), WeaponRouter()],
      bottomNavigationBuilder: (BuildContext context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/chars/Traveler (Geo).png"),
                size: 30,
              ),
              label: 'Chars',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/weapon-icons/sword.png"),
                size: 30,
              ),
              label: 'Weapons',
            ),
          ],
        );
      },
    );
  }
}
