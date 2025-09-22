import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/supabase_config.dart';

class InternService {
  // Complete intern profile setup
  static Future<bool> completeProfile({
    required String fullName,
    required String phoneNumber,
    required String location,
    required String fieldOfStudy,
    required String universityInstitution,
    required String graduationYear,
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

      // Update intern record
      await supabase
          .from('interns')
          .update({
            'field_of_study': fieldOfStudy,
            'university_institution': universityInstitution,
            'graduation_year': graduationYear,
          })
          .eq('user_id', user.id);

      // Update password
      await supabase.auth.updateUser(UserAttributes(password: newPassword));

      return true;
    } catch (e) {
      return false;
    }
  }

  // Complete track selection (final onboarding step)
  static Future<bool> completeTrackSelection(String selectedTrack) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return false;

      // Update intern with selected track
      await supabase
          .from('interns')
          .update({'track': selectedTrack, 'is_ready_for_assignment': true})
          .eq('user_id', user.id);

      return true;
    } catch (e) {
      return false;
    }
  }

  // Get intern dashboard data
  static Future<Map<String, dynamic>> getDashboardData() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return {};

      // Get intern data with supervisor info
      final internResult =
          await supabase
              .from('interns')
              .select('''
            id,
            track,
            supervisor_id,
            is_ready_for_assignment,
            supervisors (
              profiles!inner (
                full_name,
                email
              )
            )
          ''')
              .eq('user_id', user.id)
              .single();

      if (internResult['supervisor_id'] == null) {
        return {
          'assigned': false,
          'track': internResult['track'],
          'ready_for_assignment': internResult['is_ready_for_assignment'],
        };
      }

      return {
        'assigned': true,
        'track': internResult['track'],
        'supervisor': internResult['supervisors'],
      };
    } catch (e) {
      return {'assigned': false};
    }
  }

  // Get intern's tasks
  static Future<List<Map<String, dynamic>>> getTasks() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return [];

      final internResult =
          await supabase
              .from('interns')
              .select('id')
              .eq('user_id', user.id)
              .single();

      final result = await supabase
          .from('task_assignments')
          .select('''
            id,
            status,
            tasks!inner (
              id,
              title,
              description,
              due_date
            )
          ''')
          .eq('intern_id', internResult['id'])
          .order('created_at', ascending: false);

      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }
}
