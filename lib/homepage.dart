import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project1/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      body: userData.when(data: (data) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                          width: 40, height: 40, decoration: const BoxDecoration(shape: BoxShape.circle), child: Image.network(data[index].avatar.toString())),
                      title: Text('${data[index].firstName} ${data[index].lastName}'),
                      subtitle: Text(data[index].email ?? 'NA'),
                      // trailing: Text(data[index].id.toString()),
                    );
                  }),
            ),
          ],
        );
      }, error: (error, errorStack) {
        return Text(error.toString());
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
