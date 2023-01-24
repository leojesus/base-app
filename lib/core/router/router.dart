import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/presentation/pages/char_detail_page.dart';
import 'package:genshin_builder/features/chars/presentation/pages/char_list_page.dart';
import 'package:genshin_builder/features/weapons/presentation/pages/weapon_detail_page.dart';
import 'package:genshin_builder/features/weapons/presentation/pages/weapon_list_page.dart';
import 'package:genshin_builder/features/weapons/presentation/widgets/weapon-ascension.dart';
import 'package:genshin_builder/features/weapons/presentation/widgets/weapon-info.dart';
import 'package:genshin_builder/widgets/home.widget.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'chars',
        name: "CharRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: CharListPage),
          AutoRoute(path: ':charName', page: CharDetailPage),
          RedirectRoute(path: '*', redirectTo: '')
        ],
      ),
      AutoRoute(
        path: 'weapons',
        name: "WeaponRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: WeaponListPage),
          //AutoRoute(path: ':weaponName', page: WeaponDetailPage),
          AutoRoute(
            path: ':weaponName',
            name: "WeaponDetailRouter",
            page: WeaponDetailPage,
            children: [
              AutoRoute(
                path: 'info',
                page: WeaponInfoPage,
              ),
              AutoRoute(path: 'ascension', page: WeaponAscensionPage),
              RedirectRoute(path: '*', redirectTo: '')
            ],
          ),
          RedirectRoute(path: '*', redirectTo: '')
        ],
      ),
    ]),
  ],
)
class $AppRouter {}

class MyObserver extends AutoRouterObserver {
  WidgetRef ref;
  MyObserver(this.ref);

  @override
  void didPush(Route route, Route? previousRoute) {
    // print('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // print('New route pop: ${route.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    // print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    //  print('Tab route re-visited: ${route.name}');
  }
}
