import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';
import 'package:genshin_builder/features/filters/model/weapon_filter.model.dart';

final weaponFilterProvider = StateNotifierProvider<WeaponFilterProvider, WeaponFilter>((ref) {
  return WeaponFilterProvider(WeaponFilter("", [], []));
});

class WeaponFilterProvider extends StateNotifier<WeaponFilter> {
  WeaponFilterProvider(WeaponFilter filter) : super(filter) {
    state = filter;
  }

  void updateName(String weaponName) {
    state = WeaponFilter(weaponName, state.rarities, state.weaponTypes);
  }

  void updateRarities(List<int> rarities) {
    state = WeaponFilter(state.weaponName, rarities, state.weaponTypes);
  }

  void updateWeaponTypes(List<WeaponType> weaponType) {
    state = WeaponFilter(state.weaponName, state.rarities, weaponType);
  }
}
