import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/model/char_material_model.dart';

import '../../../core/sql/database.provider.dart';

final charMaterialProviderDef = FutureProvider.autoDispose.family<List<CharMaterial>, String>(
  (ref, charName) async {
    List<CharMaterial> materials = [];
    var entitiesFromDb = await DatabaseProvider.getDataByColumn("char_talent_materials", "charName", charName);
    for (var dbItem in entitiesFromDb) {
      materials.add(CharMaterial.fromDb(dbItem, CharMaterialType.talent));
    }

    entitiesFromDb = await DatabaseProvider.getDataByColumn("char_ascension_materials", "charName", charName);
    for (var dbItem in entitiesFromDb) {
      materials.add(CharMaterial.fromDb(dbItem, CharMaterialType.ascension));
    }
    return materials;
  },
);
