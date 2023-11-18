import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project1/main.dart';

class HomePage2 extends ConsumerWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          ref.invalidate(streamProvider);
        },
        icon: Icon(Icons.refresh),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          streamData.when(data: (data) {
            return Center(
              child: Text(data.toString()),
            );
          }, error: (error, errorTracker) {
            return Text(error.toString());
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ],
      ),
    );
  }
}
