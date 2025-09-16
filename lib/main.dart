import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dzupdfytbmocsskjeklc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dXBkZnl0Ym1vY3Nza2pla2xjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgwMTk2MjYsImV4cCI6MjA3MzU5NTYyNn0._ezVr-1abcJ2PHQGR9_4LHDceUy5gk9bbZINDbXSXG4',
  );
  runApp(const MyApp());
}

// Your app code will go here
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello, Supabase!'))),
    );
  }
}
