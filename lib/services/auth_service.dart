import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';

class AuthService {
  // Login method for your existing login screen
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Get user role and onboarding status
        final profile =
            await supabase
                .from('profiles')
                .select('role, is_onboarded, full_name')
                .eq('id', response.user!.id)
                .single();

        return {
          'success': true,
          'user': response.user,
          'role': profile['role'],
          'is_onboarded': profile['is_onboarded'],
          'full_name': profile['full_name'],
        };
      }

      return {'success': false, 'error': 'Login failed'};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // Get current user info
  static Future<Map<String, dynamic>?> getCurrentUserInfo() async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    try {
      final profile =
          await supabase
              .from('profiles')
              .select('role, is_onboarded, full_name')
              .eq('id', user.id)
              .single();

      return {
        'user_id': user.id,
        'email': user.email,
        'role': profile['role'],
        'is_onboarded': profile['is_onboarded'],
        'full_name': profile['full_name'],
      };
    } catch (e) {
      return null;
    }
  }

  // Logout
  static Future<void> logout() async {
    await supabase.auth.signOut();
  }

  // Update password
  static Future<bool> updatePassword(String newPassword) async {
    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
      return true;
    } catch (e) {
      return false;
    }
  }
}
