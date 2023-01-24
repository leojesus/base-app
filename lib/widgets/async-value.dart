import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
    this.value,
    this.builder,
  );

  final AsyncValue<T> value;

  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, _) => Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          error.toString(),
          textAlign: TextAlign.center,
        ),
      ),
      data: (data) => builder(context, data),
    );
  }
}
