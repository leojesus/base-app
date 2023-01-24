import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/filters/providers/char_filter.provider.dart';

import '../../../core/sql/database.provider.dart';
import '../model/char_model.dart';

final filteredCharProvider = StateProvider<AsyncValue<List<Char>>>((ref) {
  final filterProvider = ref.watch(charFilterProvider);
  final charProviderData = ref.watch(charProvider);
  if (charProviderData is! AsyncData) {
    return const AsyncLoading();
  }
  var list = charProviderData.value;
  if (list != null) {
    list =
        list.where((char) => (filterProvider.charName.isEmpty || char.name.toLowerCase().contains(filterProvider.charName.toLowerCase()))).toList();

    list = list.where((char) => (filterProvider.elements.isEmpty || filterProvider.elements.contains(char.element))).toList();
    list = list.where((char) => (filterProvider.weaponTypes.isEmpty || filterProvider.weaponTypes.contains(char.weaponType))).toList();
    list = list.where((char) => (filterProvider.rarities.isEmpty || filterProvider.rarities.contains(char.rarity))).toList();

    return AsyncData(list);
  } else {
    return const AsyncData([]);
  }
});

final charProvider = StateNotifierProvider<CharProvider, AsyncValue<List<Char>>>((ref) {
  return CharProvider();
});

class CharProvider extends StateNotifier<AsyncValue<List<Char>>> {
  CharProvider() : super(const AsyncValue.loading()) {
    loadAll();
  }

  loadAll() async {
    List<Char> chars = [];
    var entitiesFromDb = await DatabaseProvider.getData("char_detail");

    for (var dbItem in entitiesFromDb) {
      chars.add(Char.fromDb(dbItem));
    }
    chars.sort((a, b) => a.name.compareTo(b.name));
    state = AsyncData(chars);
  }

  Char? findByName(String name) {
    return state.value?.firstWhereOrNull((Char item) => item.name == name);
  }
}
