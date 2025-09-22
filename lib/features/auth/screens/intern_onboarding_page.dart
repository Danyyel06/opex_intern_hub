import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/onboarding_journey.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Add controllers for each field at the top of _ProfileScreenState
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fieldOfStudyController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  XFile? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  bool _obscurePassword = true;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Your Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E3A8A), // Deep blue color
          ),
        ),
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Avatar Section
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child:
                      _pickedImage == null
                          ? Icon(Icons.person, size: 60, color: Colors.black)
                          : ClipOval(
                            child: Image.file(
                              File(_pickedImage!.path),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
              ),
            ),

            SizedBox(height: 40),

            // Full Name Section
            _buildInputField(
              label: 'Full Name',
              icon: Icons.person,
              controller: fullNameController,
              hintText: 'Ifeoluwa Bankole Simeon',
            ),

            SizedBox(height: 20),

            // Phone Number Section
            _buildInputField(
              label: 'Phone Number',
              icon: Icons.phone,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              hintText: '070 000 00 000',
            ),

            SizedBox(height: 20),

            // Location Section
            _buildInputField(
              label: 'Location',
              icon: Icons.location_on,
              controller: locationController,
              hintText: 'Lokoja, Nigeria',
            ),

            SizedBox(height: 20),

            // Email Section
            _buildInputField(
              label: 'Email',
              icon: Icons.email,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'tolagben23@gmail.com',
            ),

            SizedBox(height: 30),

            // Academic & Personal Information Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6), // Light gray background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Academic & Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Field of Study
                  _buildInputField(
                    label: 'Field Of Study',
                    controller: fieldOfStudyController,
                    hintText: 'Computer Science',
                  ),

                  SizedBox(height: 16),

                  // University/Institution
                  _buildInputField(
                    label: 'University/Institution',
                    controller: universityController,
                    hintText: 'Lagos State University',
                  ),

                  SizedBox(height: 16),

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
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Upload CV Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFD1D5DB),
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Upload your CV',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF102592), // Blue color
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Drag your file(s) to start uploading',
                    style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'OR',
                    style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                  ),

                  SizedBox(height: 16),

                  OutlinedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc', 'docx'],
                          );

                      if (result != null) {
                        print('File selected: ${result.files.single.name}');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF1E3A8A)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Browse files',
                      style: TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Complete Profile Button
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingHome()),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3A8A), // Deep blue color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                          'Complete Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Add this new widget to replace _buildProfileField and _buildAcademicField
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
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon:
                icon != null ? Icon(icon, size: 20, color: Colors.black) : null,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF1E3A8A)),
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
