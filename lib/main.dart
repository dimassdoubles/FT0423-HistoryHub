import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:history_hub/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_KEY"]!,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
