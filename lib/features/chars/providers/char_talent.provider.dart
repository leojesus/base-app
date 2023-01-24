import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/model/char_talent_model.dart';

import '../../../core/sql/database.provider.dart';

final charTalentProviderDef = FutureProvider.autoDispose.family<List<CharTalent>, String>(
  (ref, charName) async {
    List<CharTalent> talents = [];
    var entitiesFromDb = await DatabaseProvider.getDataByColumn("char_talent", "charName", charName);
    for (var dbItem in entitiesFromDb) {
      talents.add(CharTalent.fromDb(dbItem));
    }
    if (talents.isNotEmpty) {
      ref.read(currentTalentProvider.notifier).state = talents[0];
    }
    return talents;
  },
);

final currentTalentProvider = StateProvider<CharTalent?>((_) => null);
