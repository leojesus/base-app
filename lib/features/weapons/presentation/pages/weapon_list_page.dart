import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/filter.widget.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/weapon-filter/weapon_additional_filter.widget.dart';
import 'package:genshin_builder/features/filters/providers/weapon_filter.provider.dart';
import 'package:genshin_builder/features/weapons/presentation/widgets/weapon-tile.dart';
import 'package:genshin_builder/features/weapons/providers/weapon.provider.dart';
import 'package:genshin_builder/widgets/async-value.dart';

class WeaponListPage extends ConsumerWidget {
  const WeaponListPage({super.key});

  showFilter(BuildContext context) {
    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        enableDrag: true,
        builder: (context) => WeaponAdditionalFilterWidget());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredWeaponData = ref.watch(filteredWeaponProvider);

    return AsyncValueWidget(filteredWeaponData, (context, data) {
      return Column(
        children: [
          FilterContent(
            "",
            onSearch: (text) {
              ref.read(weaponFilterProvider.notifier).updateName(text);
            },
            onAdditionalFilter: () {
              showFilter(context);
            },
          ),
          if (data.isEmpty) const Text("No weapons found"),
          if (data.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return WeaponTile(data[index]);
                },
                itemCount: data.length,
              ),
            ),
        ],
      );
    });
  }
}
