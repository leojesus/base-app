import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/model/char_constelation_model.dart';

import '../../../core/sql/database.provider.dart';

final charConstelationProviderDef = FutureProvider.autoDispose.family<List<CharConstelation>, String>(
  (ref, charName) async {
    List<CharConstelation> constelations = [];
    var entitiesFromDb = await DatabaseProvider.getDataByColumn("char_constelation", "charName", charName);
    for (var dbItem in entitiesFromDb) {
      constelations.add(CharConstelation.fromDb(dbItem));
    }
    if (constelations.isNotEmpty) {
      ref.read(currentConstelationProvider.notifier).state = constelations[0];
    }
    return constelations;
  },
);

final currentConstelationProvider = StateProvider<CharConstelation?>((_) => null);
