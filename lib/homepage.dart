import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project1/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Center(child: Text(name)),
        ),
      ),
    );
  }
}

