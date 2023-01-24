import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genshin_builder/features/chars/presentation/widgets/char_detail.dart';

class CharDetailPage extends ConsumerWidget {
  final String charName;
  const CharDetailPage(this.charName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CharDetail(charName),
          ],
        ),
      ),
    );
  }
}
