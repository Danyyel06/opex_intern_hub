// auth_gate.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:opex_intern_hub/features/admin/screens/admin_dashboard.dart';
import 'package:opex_intern_hub/features/auth/screens/login_screen.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_dashboard.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final _supabase = Supabase.instance.client;
  User? _currentUser;
  String? _userRole;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session == null) {
        // No user logged in, reset state
        setState(() {
          _currentUser = null;
          _userRole = null;
          _isLoading = false;
        });
      } else {
        setState(() {
          _currentUser = session.user;
          _isLoading = true;
        });
        _checkUserRole(_currentUser!.id);
      }
    });
    // Initial check on app start
    final session = _supabase.auth.currentSession;
    if (session != null) {
      _checkUserRole(session.user.id);
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkUserRole(String userId) async {
    try {
      // Check if the user is an admin
      final adminResponse = await _supabase
          .from('admins')
          .select()
          .eq('admin_id', userId);
      if (adminResponse.isNotEmpty) {
        setState(() {
          _userRole = 'admin';
        });
        return;
      }

      // Check if the user is an intern
      final internResponse = await _supabase
          .from('interns')
          .select()
          .eq('intern_id', userId);
      if (internResponse.isNotEmpty) {
        setState(() {
          _userRole = 'intern';
        });
        return;
      }

      // Check if the user is a supervisor
      final supervisorResponse = await _supabase
          .from('supervisors')
          .select()
          .eq('supervisor_id', userId);
      if (supervisorResponse.isNotEmpty) {
        setState(() {
          _userRole = 'supervisor';
        });
        return;
      }

      // If no role is found, set to unknown
      setState(() {
        _userRole = 'unknown';
      });
    } catch (e) {
      print('Error checking user role: $e');
      setState(() {
        _userRole = 'unknown'; // Fallback in case of error
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_currentUser == null) {
      return const LoginScreen(); // User is not logged in, show AuthScreen
    } else {
      switch (_userRole) {
        case 'admin':
          return const AdminDashboard();
        case 'intern':
          return const InternDashboard();
        case 'supervisor':
          return const SupervisorDashboard();
        default:
          // Unknown role or no role found, log out for security
          _supabase.auth.signOut();
          return const LoginScreen();
      }
    }
  }
}
