import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project1/api_service.dart';
import 'package:riverpod_project1/homepage.dart';
import 'package:riverpod_project1/user_model.dart';

//Declaration a value using riverpod
final apiProvider = Provider<ApiService>(
  (ref) {
    return ApiService();
  },
);
final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});
//wrap the MyApp class by ProviderScope
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
