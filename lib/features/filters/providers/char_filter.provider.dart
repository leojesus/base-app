import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/model/element_enum.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';
import 'package:genshin_builder/features/filters/model/char_filter.model.dart';

final charFilterProvider = StateNotifierProvider<CharFilterProvider, CharFilter>((ref) {
  return CharFilterProvider(CharFilter("", [], [], []));
});

class CharFilterProvider extends StateNotifier<CharFilter> {
  CharFilterProvider(CharFilter filter) : super(filter) {
    state = filter;
  }

  void updateName(String charName) {
    state = CharFilter(charName, state.elements, state.rarities, state.weaponTypes);
  }

  void updateElements(List<CharElement> elements) {
    state = CharFilter(state.charName, elements, state.rarities, state.weaponTypes);
  }

  void updateRarities(List<int> rarities) {
    state = CharFilter(state.charName, state.elements, rarities, state.weaponTypes);
  }

  void updateWeaponTypes(List<WeaponType> weaponType) {
    state = CharFilter(state.charName, state.elements, state.rarities, weaponType);
  }
}
