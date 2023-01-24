import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';
import 'package:genshin_builder/features/filters/providers/weapon_filter.provider.dart';

List<S2Choice<WeaponType>> allTypes = WeaponType.values.map((WeaponType weaponType) {
  return S2Choice<WeaponType>(value: weaponType, title: weaponType.name);
}).toList();

class WeaponTypeFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterRiverPod = ref.watch(weaponFilterProvider);
    return SmartSelect<WeaponType>.multiple(
      modalHeaderStyle: S2ModalHeaderStyle(
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      choiceStyle: S2ChoiceStyle(titleStyle: Theme.of(context).textTheme.bodyMedium),
      modalType: S2ModalType.bottomSheet,
      title: 'Weapon type',
      placeholder: "Select one or more",
      selectedValue: filterRiverPod.weaponTypes,
      choiceItems: allTypes,
      modalConfirm: true,
      modalActionsBuilder: (context, state) {
        return [];
      },
      modalDividerBuilder: (context, state) {
        return const Divider(height: 1);
      },
      onChange: (state) {
        ref.read(weaponFilterProvider.notifier).updateWeaponTypes(state.value);
      },
      choiceSecondaryBuilder: (context, state, choice) {
        return Image.asset(
          choice.value.imagePath,
          color: Theme.of(context).colorScheme.primary,
          width: 30,
        );
      },
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          title: Text("Weapon Type", style: Theme.of(context).textTheme.bodyMedium),
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
                  ref.read(weaponFilterProvider.notifier).updateWeaponTypes([]);
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
