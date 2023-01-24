import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/presentation/widgets/char_tile.dart';
import 'package:genshin_builder/features/chars/providers/char.provider.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/char-filter/char_additional_filter.widget.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/filter.widget.dart';
import 'package:genshin_builder/features/filters/providers/char_filter.provider.dart';
import 'package:genshin_builder/widgets/async-value.dart';

class CharListPage extends ConsumerWidget {
  const CharListPage({super.key});

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
        builder: (context) => CharAdditionalFilterWidget());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(filteredCharProvider);
    return Scaffold(
      body: AsyncValueWidget(provider, (context, data) {
        return Column(
          children: [
            FilterContent(
              "",
              onSearch: (text) {
                ref.read(charFilterProvider.notifier).updateName(text);
              },
              onAdditionalFilter: () {
                showFilter(context);
              },
            ),
            if (data.isEmpty) const Text("No chars found"),
            if (data.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CharTile(data[index]);
                  },
                  itemCount: data.length,
                ),
              ),
          ],
        );
      }),
    );
  }
}
