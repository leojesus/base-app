import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/filters/providers/weapon_filter.provider.dart';

List<S2Choice<int>> allRarities = [
  S2Choice<int>(value: 4, title: '4 stars'),
  S2Choice<int>(value: 5, title: '5 starts'),
];

class WeaponRarityFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterRiverPod = ref.watch(weaponFilterProvider);
    return SmartSelect<int>.multiple(
      modalHeaderStyle: S2ModalHeaderStyle(
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      choiceStyle: S2ChoiceStyle(titleStyle: Theme.of(context).textTheme.bodyMedium),
      modalType: S2ModalType.bottomSheet,
      title: 'Rarity',
      placeholder: "Select one or more",
      selectedValue: filterRiverPod.rarities,
      choiceItems: allRarities,
      modalConfirm: true,
      modalActionsBuilder: (context, state) {
        return [];
      },
      modalDividerBuilder: (context, state) {
        return const Divider(height: 1);
      },
      onChange: (state) {
        ref.read(weaponFilterProvider.notifier).updateRarities(state.value);
      },
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          title: Text("Rarity", style: Theme.of(context).textTheme.bodyMedium),
          isTwoLine: true,
        );
      },
      modalFooterBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 7.0,
          ),
          child: Row(
            children: <Widget>[
              const Spacer(),
              TextButton(
                child: const Text('Clear'),
                onPressed: () {
                  ref.read(weaponFilterProvider.notifier).updateRarities([]);
                  state.closeModal(confirmed: false);
                },
              ),
              const SizedBox(width: 5),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => state.closeModal(confirmed: false),
              ),
              const SizedBox(width: 5),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  state.closeModal(confirmed: true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
