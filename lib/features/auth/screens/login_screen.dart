import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:opex_intern_hub/features/auth/screens/intern_onboarding_page.dart';
import 'package:opex_intern_hub/features/auth/screens/forgot_password.dart';

import 'package:opex_intern_hub/features/intern/screens/intern_dashboard.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';
import 'package:opex_intern_hub/features/admin/screens/admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  Future<void> _signIn() async {
    setState(() {
      _isLoading = true; // Start the loading indicator
    });

    try {
      final AuthResponse res = await Supabase.instance.client.auth
          .signInWithPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      // After successful login, check if the user object is not null
      final user = res.user;
      if (user != null) {
        // Step 1: Fetch the user's type from the 'users' table
        final response =
            await Supabase.instance.client
                .from('users')
                .select('user_type')
                .eq('user_id', user.id)
                .single();

        final userType = response['user_type'];

        // Step 2: Navigate based on user_type
        if (userType == 'intern') {
          // Check the 'is_onboarded' flag for interns
          final internResponse =
              await Supabase.instance.client
                  .from('interns')
                  .select('is_onboarded')
                  .eq('intern_id', user.id)
                  .single();

          if (internResponse['is_onboarded'] == false) {
            // Navigate to the onboarding flow
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ), // Your onboarding page
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const InternDashboard()),
            );
          }
        } else if (userType == 'supervisor') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SupervisorDashboard(),
            ),
          );
        } else if (userType == 'admin') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AdminDashboard()),
          );
        }
      }
    } on AuthException catch (e) {
      // Handle authentication errors, like wrong password
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      // Handle any other errors
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false; // Stop the loading indicator
      });
      print('isLoading is now : $_isLoading');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Title
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A8A),
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                const Text(
                  'Welcome back. Pick up where you left off and\ncontinue your path to professional excellence.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 60),

                // Email field
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF374151),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xFF102592),
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      hintText: 'opexintern@gmail.com',
                      hintStyle: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF9CA3AF),
                        letterSpacing: 1,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 16),

                // Password field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF102592),
                      width: 2,
                    ),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF374151),
                    ),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF9CA3AF),
                        letterSpacing: 2,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color(0xFF9CA3AF),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9CA3AF),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Login Button
                Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () => _signIn(),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
