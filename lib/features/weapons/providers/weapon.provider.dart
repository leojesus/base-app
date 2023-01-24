import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/sql/database.provider.dart';
import 'package:genshin_builder/features/filters/providers/weapon_filter.provider.dart';
import 'package:genshin_builder/features/weapons/model/weapon.model.dart';

final filteredWeaponProvider = StateProvider<AsyncValue<List<Weapon>>>((ref) {
  final filterProvider = ref.watch(weaponFilterProvider);
  final weaponProviderData = ref.watch(weaponProvider);
  if (weaponProviderData is! AsyncData) {
    return const AsyncLoading();
  }
  var list = weaponProviderData.value;
  if (list != null) {
    list = list
        .where((weapon) => (filterProvider.weaponName.isEmpty || weapon.name.toLowerCase().contains(filterProvider.weaponName.toLowerCase())))
        .toList();

    list = list.where((weapon) => (filterProvider.weaponTypes.isEmpty || filterProvider.weaponTypes.contains(weapon.type))).toList();
    list = list.where((weapon) => (filterProvider.rarities.isEmpty || filterProvider.rarities.contains(weapon.rarity))).toList();

    return AsyncData(list);
  } else {
    return const AsyncData([]);
  }
});

final weaponProvider = StateNotifierProvider<WeaponProvider, AsyncValue<List<Weapon>>>((ref) {
  return WeaponProvider();
});

class WeaponProvider extends StateNotifier<AsyncValue<List<Weapon>>> {
  WeaponProvider() : super(AsyncValue.loading()) {
    loadAllWeapons();
  }

  loadAllWeapons() async {
    List<Weapon> weapons = [];
    var weaponFromDb = await DatabaseProvider.getData("weapon");

    for (var dbItem in weaponFromDb) {
      weapons.add(Weapon.fromDb(dbItem));
    }
    weapons.sort((a, b) => a.name.compareTo(b.name));
    state = AsyncData(weapons);
  }

  Weapon? findByName(String name) {
    return state.value?.firstWhereOrNull((Weapon item) => item.name == name);
  }
}
