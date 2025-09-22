import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/supabase_config.dart';

class SupervisorService {
  // Complete supervisor onboarding
  static Future<bool> completeOnboarding({
    required String fullName,
    required String phoneNumber,
    required String location,
    required String roleTitle,
    required String department,
    required String newPassword,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return false;

      // Update profile
      await supabase
          .from('profiles')
          .update({
            'full_name': fullName,
            'phone_number': phoneNumber,
            'location': location,
            'is_onboarded': true,
          })
          .eq('id', user.id);

      // Create supervisor record
      await supabase.from('supervisors').insert({
        'user_id': user.id,
        'role_title': roleTitle,
        'department': department,
      });

      // Update password
      await supabase.auth.updateUser(UserAttributes(password: newPassword));

      return true;
    } catch (e) {
      return false;
    }
  }

  // Get supervisor dashboard data
  static Future<Map<String, dynamic>> getDashboardData() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return {};

      // Get supervisor ID
      final supervisorResult =
          await supabase
              .from('supervisors')
              .select('id')
              .eq('user_id', user.id)
              .single();

      final supervisorId = supervisorResult['id'];

      // Get supervised interns
      final internsResult = await supabase
          .from('interns')
          .select('''
            id,
            profiles!inner (
              full_name
            )
          ''')
          .eq('supervisor_id', supervisorId);

      // Get pending reviews (simplified for now)
      final pendingReviews = 0; // We'll implement this later if needed

      return {
        'pending_reviews': pendingReviews,
        'supervised_interns': List<Map<String, dynamic>>.from(internsResult),
      };
    } catch (e) {
      return {'pending_reviews': 0, 'supervised_interns': []};
    }
  }

  // Create task
  static Future<bool> createTask({
    required String title,
    required String description,
    required DateTime dueDate,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return false;

      // Get supervisor ID
      final supervisorResult =
          await supabase
              .from('supervisors')
              .select('id')
              .eq('user_id', user.id)
              .single();

      // Create task
      await supabase.from('tasks').insert({
        'title': title,
        'description': description,
        'supervisor_id': supervisorResult['id'],
        'due_date': dueDate.toIso8601String().split('T')[0],
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  // Get supervisor's tasks
  static Future<List<Map<String, dynamic>>> getTasks() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return [];

      final supervisorResult =
          await supabase
              .from('supervisors')
              .select('id')
              .eq('user_id', user.id)
              .single();

      final result = await supabase
          .from('tasks')
          .select('id, title, description, due_date, created_at')
          .eq('supervisor_id', supervisorResult['id'])
          .order('created_at', ascending: false);

      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }
}
