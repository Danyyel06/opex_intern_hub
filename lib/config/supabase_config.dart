import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://dzupdfytbmocsskjeklc.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dXBkZnl0Ym1vY3Nza2pla2xjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgwMTk2MjYsImV4cCI6MjA3MzU5NTYyNn0._ezVr-1abcJ2PHQGR9_4LHDceUy5gk9bbZINDbXSXG4';

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
}

final supabase = Supabase.instance.client;
