import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://nkjkvtsmvidehvkjrsmc.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ramt2dHNtdmlkZWh2a2pyc21jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg1MzUzODUsImV4cCI6MjA3NDExMTM4NX0.T8Zal7xfHo5V2_2ZDMxJZolLDv_3uK1ChyEI2RviFTI';

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
}

final supabase = Supabase.instance.client;
