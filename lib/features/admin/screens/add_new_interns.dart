import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/admin/screens/admin_dashboard.dart';
import 'package:opex_intern_hub/features/admin/widgets/congrats.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnboardInternWidget extends StatefulWidget {
  const OnboardInternWidget({Key? key}) : super(key: key);

  @override
  State<OnboardInternWidget> createState() => _OnboardInternWidgetState();
}

class _OnboardInternWidgetState extends State<OnboardInternWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _createIntern() async {
    // Generate a temporary password. For simplicity, you can use a fixed one for testing.
    final temporaryPassword = 'temp_password_123';

    setState(() {
      _isLoading = true; // Set a loading state
    });

    try {
      // Step 1: Create the user account in Supabase Authentication
      // This method is for admin-level user creation.
      final UserResponse res = await Supabase.instance.client.auth.admin
          .createUser(
            {
                  'email': _emailController.text.trim(),
                  'password': temporaryPassword,
                }
                as AdminUserAttributes,
          );

      final newUser = res.user;

      if (newUser != null) {
        // Step 2: Insert the user's profile into the 'interns' table
        await Supabase.instance.client.from('interns').insert({
          'intern_id': newUser.id, // Link to the Supabase user ID
          'full_name': _nameController.text.trim(),
          'is_onboarded': false, // Set to false for the onboarding process
          'track_id': null, // This will be updated later during onboarding
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Intern account created successfully!')),
        );

        // Navigate back to the Admin Dashboard
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminDashboard()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating user: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred: ${e.toString()}'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Remove pre-populated text for hint text usage
    // _nameController.text = 'Olunupe Kolade Emmanuel';
    // _emailController.text = 'koladeemma21@gmail.com';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FD),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E3A8A)),
        title: const Text(
          'Back',
          style: TextStyle(
            color: Color(0xFF1E3A8A),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Header Title
              const Text(
                'Onboard a new Intern',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E3A8A),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 60),

              // Profile Image Placeholder
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: const Color(0xFFD1D5DB),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),

              const SizedBox(height: 80),

              // Name Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Olunupe Kolade Emmanuel',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFF1E3A8A),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Email Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'E-mail',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'koladeemma21@gmail.com',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xFF1E3A8A),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Create Intern Account Button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupervisorAssignedScreen(),
                      ),
                    );
                    print(
                      'Creating intern account for: ${_nameController.text}',
                    );
                    print('Email: ${_emailController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: const Text(
                    'Create Intern Account',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
