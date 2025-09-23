import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/onboarding_journey.dart';
import 'package:opex_intern_hub/services/intern_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for each field
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fieldOfStudyController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController graduationYearController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  Future<void> _completeProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await InternService.completeProfile(
        fullName: fullNameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        location: locationController.text.trim(),
        fieldOfStudy: fieldOfStudyController.text.trim(),
        universityInstitution: universityController.text.trim(),
        graduationYear: graduationYearController.text.trim(),
        newPassword: passwordController.text,
      );

      setState(() => _isLoading = false);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile completed successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to onboarding journey (track selection)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingHome()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to complete profile. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
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
    fieldOfStudyController.dispose();
    universityController.dispose();
    graduationYearController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Your Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E3A8A),
          ),
        ),
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                            ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.black,
                            )
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

              const SizedBox(height: 20),

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

              const SizedBox(height: 20),

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

              const SizedBox(height: 20),

              // Email Section (editable)
              _buildInputField(
                label: 'Email',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'tolagben23@gmail.com',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Academic & Personal Information Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Academic & Personal Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Field of Study
                    _buildInputField(
                      label: 'Field Of Study',
                      controller: fieldOfStudyController,
                      hintText: 'Computer Science',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your field of study';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // University/Institution
                    _buildInputField(
                      label: 'University/Institution',
                      controller: universityController,
                      hintText: 'Lagos State University',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your university/institution';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Graduation Year
                    _buildInputField(
                      label: 'Expected Graduation Year',
                      controller: graduationYearController,
                      hintText: '2025',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your expected graduation year';
                        }
                        final year = int.tryParse(value.trim());
                        if (year == null || year < 2020 || year > 2030) {
                          return 'Please enter a valid year between 2020 and 2030';
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
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Upload CV Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFD1D5DB),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Upload your CV',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF102592),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.file_copy_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Drag your file(s) to start uploading',
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                    ),

                    const SizedBox(height: 16),

                    OutlinedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc', 'docx'],
                            );

                        if (result != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'File selected: ${result.files.single.name}',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1E3A8A)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
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

              const SizedBox(height: 30),

              // Complete Profile Button
              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _completeProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'Complete Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
              ),

              const SizedBox(height: 30),
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
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
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
