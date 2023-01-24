// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i10;

import '../../features/chars/presentation/pages/char_detail_page.dart' as _i4;
import '../../features/chars/presentation/pages/char_list_page.dart' as _i3;
import '../../features/weapons/presentation/pages/weapon_detail_page.dart' as _i6;
import '../../features/weapons/presentation/pages/weapon_list_page.dart' as _i5;
import '../../features/weapons/presentation/widgets/weapon-ascension.dart' as _i8;
import '../../features/weapons/presentation/widgets/weapon-info.dart' as _i7;
import '../../widgets/home.widget.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CharRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    WeaponRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    CharListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CharListPage(),
      );
    },
    CharDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CharDetailRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CharDetailPage(
          args.charName,
          key: args.key,
        ),
      );
    },
    WeaponListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WeaponListPage(),
      );
    },
    WeaponDetailRouter.name: (routeData) {
      final args = routeData.argsAs<WeaponDetailRouterArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.WeaponDetailPage(
          args.weaponName,
          key: args.key,
        ),
      );
    },
    WeaponInfoRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponInfoRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.WeaponInfoPage(
          args.weaponName,
          key: args.key,
        ),
      );
    },
    WeaponAscensionRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponAscensionRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.WeaponAscensionPage(
          args.weaponName,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              CharRouter.name,
              path: 'chars',
              parent: HomeRoute.name,
              children: [
                _i9.RouteConfig(
                  CharListRoute.name,
                  path: '',
                  parent: CharRouter.name,
                ),
                _i9.RouteConfig(
                  CharDetailRoute.name,
                  path: ':charName',
                  parent: CharRouter.name,
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: CharRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i9.RouteConfig(
              WeaponRouter.name,
              path: 'weapons',
              parent: HomeRoute.name,
              children: [
                _i9.RouteConfig(
                  WeaponListRoute.name,
                  path: '',
                  parent: WeaponRouter.name,
                ),
                _i9.RouteConfig(
                  WeaponDetailRouter.name,
                  path: ':weaponName',
                  parent: WeaponRouter.name,
                  children: [
                    _i9.RouteConfig(
                      WeaponInfoRoute.name,
                      path: 'info',
                      parent: WeaponDetailRouter.name,
                    ),
                    _i9.RouteConfig(
                      WeaponAscensionRoute.name,
                      path: 'ascension',
                      parent: WeaponDetailRouter.name,
                    ),
                    _i9.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: WeaponDetailRouter.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: WeaponRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CharRouter extends _i9.PageRouteInfo<void> {
  const CharRouter({List<_i9.PageRouteInfo>? children})
      : super(
          CharRouter.name,
          path: 'chars',
          initialChildren: children,
        );

  static const String name = 'CharRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class WeaponRouter extends _i9.PageRouteInfo<void> {
  const WeaponRouter({List<_i9.PageRouteInfo>? children})
      : super(
          WeaponRouter.name,
          path: 'weapons',
          initialChildren: children,
        );

  static const String name = 'WeaponRouter';
}

/// generated route for
/// [_i3.CharListPage]
class CharListRoute extends _i9.PageRouteInfo<void> {
  const CharListRoute()
      : super(
          CharListRoute.name,
          path: '',
        );

  static const String name = 'CharListRoute';
}

/// generated route for
/// [_i4.CharDetailPage]
class CharDetailRoute extends _i9.PageRouteInfo<CharDetailRouteArgs> {
  CharDetailRoute({
    required String charName,
    _i10.Key? key,
  }) : super(
          CharDetailRoute.name,
          path: ':charName',
          args: CharDetailRouteArgs(
            charName: charName,
            key: key,
          ),
        );

  static const String name = 'CharDetailRoute';
}

class CharDetailRouteArgs {
  const CharDetailRouteArgs({
    required this.charName,
    this.key,
  });

  final String charName;

  final _i10.Key? key;

  @override
  String toString() {
    return 'CharDetailRouteArgs{charName: $charName, key: $key}';
  }
}

/// generated route for
/// [_i5.WeaponListPage]
class WeaponListRoute extends _i9.PageRouteInfo<void> {
  const WeaponListRoute()
      : super(
          WeaponListRoute.name,
          path: '',
        );

  static const String name = 'WeaponListRoute';
}

/// generated route for
/// [_i6.WeaponDetailPage]
class WeaponDetailRouter extends _i9.PageRouteInfo<WeaponDetailRouterArgs> {
  WeaponDetailRouter({
    required String weaponName,
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WeaponDetailRouter.name,
          path: ':weaponName',
          args: WeaponDetailRouterArgs(
            weaponName: weaponName,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeaponDetailRouter';
}

class WeaponDetailRouterArgs {
  const WeaponDetailRouterArgs({
    required this.weaponName,
    this.key,
  });

  final String weaponName;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WeaponDetailRouterArgs{weaponName: $weaponName, key: $key}';
  }
}

/// generated route for
/// [_i7.WeaponInfoPage]
class WeaponInfoRoute extends _i9.PageRouteInfo<WeaponInfoRouteArgs> {
  WeaponInfoRoute({
    required String weaponName,
    _i10.Key? key,
  }) : super(
          WeaponInfoRoute.name,
          path: 'info',
          args: WeaponInfoRouteArgs(
            weaponName: weaponName,
            key: key,
          ),
        );

  static const String name = 'WeaponInfoRoute';
}

class WeaponInfoRouteArgs {
  const WeaponInfoRouteArgs({
    required this.weaponName,
    this.key,
  });

  final String weaponName;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WeaponInfoRouteArgs{weaponName: $weaponName, key: $key}';
  }
}

/// generated route for
/// [_i8.WeaponAscensionPage]
class WeaponAscensionRoute extends _i9.PageRouteInfo<WeaponAscensionRouteArgs> {
  WeaponAscensionRoute({
    required String weaponName,
    _i10.Key? key,
  }) : super(
          WeaponAscensionRoute.name,
          path: 'ascension',
          args: WeaponAscensionRouteArgs(
            weaponName: weaponName,
            key: key,
          ),
        );

  static const String name = 'WeaponAscensionRoute';
}

class WeaponAscensionRouteArgs {
  const WeaponAscensionRouteArgs({
    required this.weaponName,
    this.key,
  });

  final String weaponName;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WeaponAscensionRouteArgs{weaponName: $weaponName, key: $key}';
  }
}
