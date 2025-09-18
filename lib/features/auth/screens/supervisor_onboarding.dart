import 'package:flutter/material.dart';

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
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1E3A8A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Supervisor Profile',
          style: TextStyle(
            color: Color(0xFF1E3A8A),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
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
                child: const Icon(Icons.person, size: 50, color: Colors.black),
              ),
            ),
            const SizedBox(height: 40),
            // Full Name Section
            _buildInputField(
              label: 'Full Name',
              icon: Icons.person,
              controller: fullNameController,
              hintText: 'Ifeoluwa Bankole Simeon',
            ),
            const SizedBox(height: 24),
            // Phone Number Section
            _buildInputField(
              label: 'Phone Number',
              icon: Icons.phone,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              hintText: '070 000 00 000',
            ),
            const SizedBox(height: 24),
            // Location Section
            _buildInputField(
              label: 'Location',
              icon: Icons.location_on,
              controller: locationController,
              hintText: 'Lokoja, Nigeria',
            ),
            const SizedBox(height: 24),
            // Email Section
            _buildInputField(
              label: 'Email',
              icon: Icons.email,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'tolagben23@gmail.com',
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
                  ),
                  const SizedBox(height: 16),
                  // Department
                  _buildInputField(
                    label: 'Department',
                    controller: departmentController,
                    hintText: 'Software Engineering',
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
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
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
        TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          keyboardType: keyboardType,
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF1E3A8A)),
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
          ),
        ),
      ],
    );
  }
}
