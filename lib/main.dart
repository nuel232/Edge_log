import 'package:edge_log/data/local/app_database.dart';
import 'package:edge_log/data/local/seed_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edge_log/data/providers/database_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();

  // TODO: move seeding to after signup once Supabase auth exists.
  await SeedService(db).seedIfNeeded('local-user');

  runApp(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(db)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: const Center(child: Text('Hello, World!')),
      ),
    );
  }
}
