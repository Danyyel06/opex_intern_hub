import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/auth/screens/enter_otp.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF1E3A8A),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Title
            const Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A8A),
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle/Description
            const Text(
              'No problem. Enter your email address below and we\'ll send you a link to reset it.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.4,
                letterSpacing: 0.1,
              ),
            ),
            const SizedBox(height: 40),
            // Email Input Field
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16, color: Color(0xFF374151)),
                decoration: const InputDecoration(
                  hintText: 'Email ID/ Mobile Number',
                  hintStyle: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button press
                  if (_emailController.text.isNotEmpty) {
                    // Add your logic here
                    print('Email/Mobile: ${_emailController.text}');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
