import 'package:flutter/material.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/weapon-filter/weapon_rarity_filter.widget.dart';
import 'package:genshin_builder/features/filters/presentation/widgets/weapon-filter/weapon_type_filter.widget.dart';

class WeaponAdditionalFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: const Icon(
                  Icons.close,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
          centerTitle: false,
          title: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("Filters"),
          ),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [WeaponTypeFilter(), WeaponRarityFilter()],
            ),
          ),
        ),
      ),
    );
  }
}
