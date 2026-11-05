import 'package:edge_log/data/local/app_database.dart';
import 'package:edge_log/data/local/seed_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define it globally
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('appDatabaseProvider not overridden');
});
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final db = AppDatabase();
  final seedService = SeedService(AppDatabase());
  await seedService.seedIfNeeded('local-user');
  runApp(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWith(() => AppDatabase())],
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
      title: 'Flutter Demo',

      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: const Center(child: Text('Hello, World!')),
      ),
    );
  }
}
