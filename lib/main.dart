import 'package:flutter/material.dart';

import 'package:cats_app/app_router.dart';

void main() {
  runApp(const CatsApp());
}

class CatsApp extends StatelessWidget {
  const CatsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}