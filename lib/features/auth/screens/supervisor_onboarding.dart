import 'package:flutter/material.dart';
import 'package:opex_intern_hub/services/supervisor_service.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';

class SupervisorProfileScreen extends StatefulWidget {
  const SupervisorProfileScreen({Key? key}) : super(key: key);

  @override
  _SupervisorProfileScreenState createState() =>
      _SupervisorProfileScreenState();
}

class _SupervisorProfileScreenState extends State<SupervisorProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSubmitting = false;

  Future<void> _completeOnboarding() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final success = await SupervisorService.completeOnboarding(
        fullName: fullNameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        location: locationController.text.trim(),
        roleTitle: roleController.text.trim(),
        department: departmentController.text.trim(),
        newPassword: passwordController.text,
      );

      setState(() => _isSubmitting = false);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile completed successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to supervisor dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SupervisorDashboard()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to complete onboarding. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    emailController.dispose();
    roleController.dispose();
    departmentController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E3A8A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Complete Your Profile',
          style: TextStyle(
            color: Color(0xFF1E3A8A),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Avatar
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Full Name Section
              _buildInputField(
                label: 'Full Name',
                icon: Icons.person,
                controller: fullNameController,
                hintText: 'Ifeoluwa Bankole Simeon',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your full name';
                  }
                  if (value.trim().length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Phone Number Section
              _buildInputField(
                label: 'Phone Number',
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                hintText: '070 000 00 000',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.trim().length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Location Section
              _buildInputField(
                label: 'Location',
                icon: Icons.location_on,
                controller: locationController,
                hintText: 'Lokoja, Nigeria',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Email Section (Read-only for reference)
              _buildInputField(
                label: 'Email',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'tolagben23@gmail.com',
                enabled: false, // Make it read-only
                validator:
                    (value) => null, // No validation needed for disabled field
              ),
              const SizedBox(height: 40),

              // Supervisor's & Personal Information Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Supervisor\'s & Personal Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Role/Title
                    _buildInputField(
                      label: 'Role/Title',
                      controller: roleController,
                      hintText: 'Senior Software Engineer',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your role/title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Department
                    _buildInputField(
                      label: 'Department',
                      controller: departmentController,
                      hintText: 'Software Engineering',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your department';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // New Password
                    _buildInputField(
                      label: 'New Password',
                      controller: passwordController,
                      isPassword: true,
                      obscureText: _obscurePassword,
                      onToggleVisibility: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      hintText: 'Enter new password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    _buildInputField(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      isPassword: true,
                      obscureText: _obscureConfirmPassword,
                      onToggleVisibility: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      hintText: 'Confirm your password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Complete Profile Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _completeOnboarding,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child:
                      _isSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'Complete Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    IconData? icon,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType? keyboardType,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    String? hintText,
    bool enabled = true,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          keyboardType: keyboardType,
          enabled: enabled,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon:
                icon != null ? Icon(icon, size: 20, color: Colors.black) : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF1E3A8A)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: onToggleVisibility,
                    )
                    : null,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[100],
          ),
        ),
      ],
    );
  }
}
