import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project1/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  ref.invalidate(countProvider);
                  // ref.refresh(countProvider);
                },
                icon: Icon(Icons.refresh),
              )
            ],
          ),
          body: Center(child: Text(count.toString())),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ref.read(countProvider.notifier).state++;
              ref.read(countProvider.notifier).update((state) => state + 1);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
