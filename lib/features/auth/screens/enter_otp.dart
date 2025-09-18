import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opex_intern_hub/features/auth/screens/reset_password.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
      }
    }
  }

  // void _onBackspace(int index) {
  //   if (controllers[index].text.isEmpty && index > 0) {
  //     FocusScope.of(context).requestFocus(focusNodes[index - 1]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Title
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2E3A8C),
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 24),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Enter the OTP code we just sent you on your registered Email/Phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 48),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => _onChanged(value, index),
                    onTap: () {
                      controllers[index].selection = TextSelection.fromPosition(
                        TextPosition(offset: controllers[index].text.length),
                      );
                    },
                    onFieldSubmitted: (value) {
                      if (index < 3 && value.isNotEmpty) {
                        FocusScope.of(
                          context,
                        ).requestFocus(focusNodes[index + 1]);
                      }
                    },
                    onEditingComplete: () {
                      if (index < 3) {
                        FocusScope.of(
                          context,
                        ).requestFocus(focusNodes[index + 1]);
                      }
                    },
                  ),
                );
              }),
            ),

            const Spacer(),

            // Reset Password Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Handle reset password action
                  String otp =
                      controllers.map((controller) => controller.text).join();
                  print('OTP: $otp');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E3A8C),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Resend OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't get OTP? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle resend OTP
                    print('Resend OTP tapped');
                  },
                  child: const TextButton(
                    onPressed: null,
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
