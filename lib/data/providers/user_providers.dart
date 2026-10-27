import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: replace with the Supabase auth user ID when auth is built
final currentUserIdProvider = Provider<String>((ref) => 'local-user');
