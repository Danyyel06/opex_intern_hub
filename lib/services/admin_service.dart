import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';
import 'dart:math';

class AdminService {
  // Get dashboard metrics for your admin dashboard
  static Future<Map<String, int>> getDashboardMetrics() async {
    try {
      final internsResult = await supabase.from('interns').select('id');
      final supervisorsResult = await supabase.from('supervisors').select('id');
      final readyForAssignmentResult = await supabase
          .from('interns')
          .select('id')
          .eq('is_ready_for_assignment', true)
          .filter('supervisor_id', 'is', null);

      return {
        'total_interns': internsResult.length,
        'total_supervisors': supervisorsResult.length,
        'ready_for_assignment': readyForAssignmentResult.length,
      };
    } catch (e) {
      return {
        'total_interns': 0,
        'total_supervisors': 0,
        'ready_for_assignment': 0,
      };
    }
  }

  // Create intern account - FIXED VERSION using Admin API
  static Future<Map<String, dynamic>> createIntern(
    String name,
    String email,
  ) async {
    try {
      // Generate temporary password
      String tempPassword = _generateTempPassword();

      // Use ADMIN API to create user without logging them in
      final response = await supabase.auth.admin.createUser(
        AdminUserAttributes(
          email: email,
          password: tempPassword,
          emailConfirm: true, // Skip email confirmation since you disabled it
        ),
      );

      if (response.user != null) {
        // Create profile
        await supabase.from('profiles').insert({
          'id': response.user!.id,
          'email': email,
          'full_name': name,
          'role': 'intern',
          'is_onboarded': false,
        });

        // Create intern record
        await supabase.from('interns').insert({'user_id': response.user!.id});

        return {'success': true, 'temp_password': tempPassword, 'email': email};
      }

      return {'success': false, 'error': 'Failed to create user'};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // Alternative method if you want to create supervisors too - ALSO FIXED
  static Future<Map<String, dynamic>> createSupervisor(
    String name,
    String email,
  ) async {
    try {
      // Generate temporary password
      String tempPassword = _generateTempPassword();

      // Use ADMIN API to create user without logging them in
      final response = await supabase.auth.admin.createUser(
        AdminUserAttributes(
          email: email,
          password: tempPassword,
          emailConfirm: true,
        ),
      );

      if (response.user != null) {
        // Create profile
        await supabase.from('profiles').insert({
          'id': response.user!.id,
          'email': email,
          'full_name': name,
          'role': 'supervisor',
          'is_onboarded': false,
        });

        return {'success': true, 'temp_password': tempPassword, 'email': email};
      }

      return {'success': false, 'error': 'Failed to create supervisor'};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // Get interns directory for your admin dashboard
  static Future<List<Map<String, dynamic>>> getInternsDirectory() async {
    try {
      final result = await supabase
          .from('interns')
          .select('''
            id,
            track,
            profiles!inner (
              full_name
            )
          ''')
          .order('created_at');

      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }

  // Get interns ready for assignment
  static Future<List<Map<String, dynamic>>>
  getInternsReadyForAssignment() async {
    try {
      final result = await supabase
          .from('interns')
          .select('''
            id,
            track,
            profiles!inner (
              full_name,
              email
            )
          ''')
          .eq('is_ready_for_assignment', true)
          .filter('supervisor_id', 'is', null);

      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }

  // Get all supervisors
  static Future<List<Map<String, dynamic>>> getAllSupervisors() async {
    try {
      final result = await supabase
          .from('supervisors')
          .select('''
            id,
            role_title,
            department,
            profiles!inner (
              full_name,
              email
            )
          ''')
          .order('created_at');

      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }

  // Assign supervisor to intern
  static Future<bool> assignSupervisorToIntern(
    String internId,
    String supervisorId,
  ) async {
    try {
      await supabase
          .from('interns')
          .update({
            'supervisor_id': supervisorId,
            'assigned_at': DateTime.now().toIso8601String(),
          })
          .eq('id', internId);

      return true;
    } catch (e) {
      return false;
    }
  }

  static String _generateTempPassword() {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(8, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))),
    );
  }
}
